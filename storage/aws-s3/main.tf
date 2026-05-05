# -----------------------------------------------------------------------------
# S3 Bucket - AWS provider 5.x compatible
# All previously-inline bucket properties are now separate resources.
# State migration note: existing buckets need `terraform import` for the new
# sub-resources (versioning, encryption, etc.) before the first apply.
# -----------------------------------------------------------------------------

locals {
  create = var.create_bucket ? 1 : 0
}

resource "aws_s3_bucket" "bucket" {
  count         = local.create
  bucket        = var.name
  force_destroy = var.force_destroy

  tags = merge(var.common_tags, var.s3_tags, { Name = var.name })
}

# Block all public access by default
resource "aws_s3_bucket_public_access_block" "bucket" {
  count  = local.create
  bucket = aws_s3_bucket.bucket[0].id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Ownership controls: use BucketOwnerEnforced (no ACLs) unless a non-private
# ACL is requested, in which case ObjectWriter allows ACL usage.
resource "aws_s3_bucket_ownership_controls" "bucket" {
  count  = local.create
  bucket = aws_s3_bucket.bucket[0].id

  rule {
    object_ownership = (var.acl != "" && var.acl != "private") ? "ObjectWriter" : "BucketOwnerEnforced"
  }

  depends_on = [aws_s3_bucket_public_access_block.bucket]
}

resource "aws_s3_bucket_acl" "bucket" {
  count  = var.create_bucket && var.acl != "" && var.acl != "private" ? 1 : 0
  bucket = aws_s3_bucket.bucket[0].id
  acl    = var.acl

  depends_on = [aws_s3_bucket_ownership_controls.bucket]
}

resource "aws_s3_bucket_versioning" "bucket" {
  count  = local.create
  bucket = aws_s3_bucket.bucket[0].id

  versioning_configuration {
    status     = var.enable_versioning ? "Enabled" : "Suspended"
    mfa_delete = var.enable_mfa_delete ? "Enabled" : "Disabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket" {
  count  = local.create
  bucket = aws_s3_bucket.bucket[0].id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.bucket.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_logging" "bucket" {
  count  = var.create_bucket && var.logging != null ? 1 : 0
  bucket = aws_s3_bucket.bucket[0].id

  target_bucket = var.logging.target_bucket
  target_prefix = var.logging.target_prefix
}

resource "aws_s3_bucket_lifecycle_configuration" "bucket" {
  count  = var.create_bucket && length(var.lifecycle_rule) > 0 ? 1 : 0
  bucket = aws_s3_bucket.bucket[0].id

  dynamic "rule" {
    for_each = var.lifecycle_rule
    content {
      id     = rule.value.id
      status = try(rule.value.enabled, true) ? "Enabled" : "Disabled"

      dynamic "expiration" {
        for_each = try([rule.value.expiration], [])
        content {
          days = expiration.value.days
        }
      }

      dynamic "noncurrent_version_expiration" {
        for_each = try([rule.value.noncurrent_version_expiration], [])
        content {
          noncurrent_days = noncurrent_version_expiration.value.days
        }
      }

      dynamic "transition" {
        for_each = try(rule.value.transition, [])
        content {
          days          = transition.value.days
          storage_class = transition.value.storage_class
        }
      }
    }
  }
}

resource "aws_s3_bucket_accelerate_configuration" "bucket" {
  count  = var.create_bucket && var.acceleration_status != "" ? 1 : 0
  bucket = aws_s3_bucket.bucket[0].id
  status = var.acceleration_status
}

resource "aws_s3_bucket_replication_configuration" "bucket" {
  count  = var.create_bucket && var.replication_configuration != null ? 1 : 0
  bucket = aws_s3_bucket.bucket[0].id
  role   = var.replication_configuration.role

  dynamic "rule" {
    for_each = try(var.replication_configuration.rules, [])
    content {
      id     = try(rule.value.id, null)
      status = try(rule.value.status, "Enabled")

      destination {
        bucket        = rule.value.destination.bucket
        storage_class = try(rule.value.destination.storage_class, null)
      }
    }
  }
}

# KMS key for bucket encryption
resource "aws_kms_key" "bucket" {
  description             = format("%s - S3 Bucket encryption key", var.name)
  deletion_window_in_days = 10
}

# Bucket policy applied after public access block to avoid conflicts
resource "aws_s3_bucket_policy" "bucket_policy" {
  count  = var.create_bucket && var.bucket_policy != "" ? 1 : 0
  bucket = aws_s3_bucket.bucket[0].id
  policy = var.bucket_policy

  depends_on = [aws_s3_bucket_public_access_block.bucket]
}
