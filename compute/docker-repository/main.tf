# -----------------------------------------------------------------------------
# Docker repository Creation
# -----------------------------------------------------------------------------

resource "aws_ecr_repository" "this" {
  count = var.required ? 1 : 0
  name  = var.repository_name

  image_tag_mutability = var.image_tag_mutability

  # Tags matching these filters take the opposite mutability (the *_WITH_EXCLUSION settings)
  dynamic "image_tag_mutability_exclusion_filter" {
    for_each = var.image_tag_mutability_exclusion_filters
    content {
      filter      = image_tag_mutability_exclusion_filter.value
      filter_type = "WILDCARD"
    }
  }

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  encryption_configuration {
    encryption_type = var.encryption_type
    kms_key         = var.kms_key_arn == "" ? null : var.kms_key_arn
  }

  tags = var.tags
}

# Only when a document is supplied: same-account IAM access needs no repository policy
resource "aws_ecr_repository_policy" "this" {
  count      = var.required && var.repository_policy_document != "" ? 1 : 0
  repository = aws_ecr_repository.this[count.index].id
  policy     = var.repository_policy_document
}

resource "aws_ecr_lifecycle_policy" "this" {
  count      = var.required && var.repository_lifecycle_document != "" ? 1 : 0
  repository = aws_ecr_repository.this[count.index].id
  policy     = var.repository_lifecycle_document
}
