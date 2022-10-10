# --------------------------------------------------------------------------------------------
# IAM Policy
# --------------------------------------------------------------------------------------------

resource "aws_iam_policy" "this" {
  count       = var.create_me
  name        = var.name
  path        = var.path
  description = "Terraform - ${var.description}"
  policy      = var.policy
}
