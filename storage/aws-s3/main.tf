# -----------------------------------------------------------------------------
# s3.tf
# - Attach an s3 policy with the s3-policy core object
# -----------------------------------------------------------------------------

resource "aws_s3_bucket" "bucket" {
  count  = "${var.count > 0 ? 1 : 0}"
  bucket = "${var.name}"
  region = "${var.region}"
  acl    = "${var.acl}"

  lifecycle_rule = "${var.lifecycle_rule}"
  force_destroy  = "${var.force_destroy}"

  acceleration_status       = "${var.acceleration_status}"
  replication_configuration = "${var.replication_configuration}"

  versioning {
    enabled    = "${var.enable_versioning}"
    mfa_delete = "${var.enable_mfa_delete}"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${aws_kms_key.bucket.arn}"
        sse_algorithm     = "aws:kms"
      }
    }
  }

  # When supplying logging data, do as follows
  #  var.logging = [{
  #    target_bucket = "test-bucket"
  #    target_prefix = "log/"
  #  }]
  logging = "${var.logging}"

  tags = "${merge(var.common_tags, var.s3_tags, map("Name", format("%s", var.name)))}"
}

# -----------------------------------------------------------------------------
# If we have policy defined as text we apply this resource
resource "aws_s3_bucket_policy" "bucket_policy" {
  count  = "${var.count > 0 && var.bucket_policy != "" ? 1 : 0}"
  bucket = "${aws_s3_bucket.this.id}"
  policy = "${var.bucket_policy}"
}

# -----------------------------------------------------------------------------
# Set up a specific key for this bucket for encryption
resource "aws_kms_key" "bucket" {
  description             = "${format("%s - S3 Bucket encryption key", var.name)}"
  deletion_window_in_days = 10
}
