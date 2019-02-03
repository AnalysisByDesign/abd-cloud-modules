# -----------------------------------------------------------------------------
# Docker repository Creation
# -----------------------------------------------------------------------------

resource "aws_ecr_repository" "this" {
  count = "${var.required ? 1 : 0}"
  name  = "${var.repository_name}"
}

resource "aws_ecr_repository_policy" "this" {
  count      = "${var.required ? 1 : 0}"
  repository = "${aws_ecr_repository.this.id}"
  policy     = "${var.repository_policy_document}"
}

resource "aws_ecr_lifecycle_policy" "this" {
  count      = "${var.required ? 1 : 0}"
  repository = "${aws_ecr_repository.this.id}"
  policy     = "${var.repository_lifecycle_document}"
}
