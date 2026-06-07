# --------------------------------------------------------------------------------------------
# IAM Roles
# --------------------------------------------------------------------------------------------

# --------------------------------------------------------------------------------------------
# Multiple role creation
# --------------------------------------------------------------------------------------------
resource "aws_iam_role" "iam-role" {
  for_each             = var.required ? var.roles : {}
  name                 = each.key
  max_session_duration = each.value.max_session_duration
  path                 = var.path
  description          = "Terraform - ${each.value.description}"
  assume_role_policy   = each.value.assume_role_policy
}

resource "aws_iam_role_policy_attachment" "iam-role" {
  for_each   = var.required ? var.roles : {}
  role       = each.key
  policy_arn = each.value.policy_arn
  depends_on = [aws_iam_role.iam-role]
}

# --------------------------------------------------------------------------------------------
