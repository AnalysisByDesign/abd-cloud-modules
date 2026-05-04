# --------------------------------------------------------------------------------------------
# IAM Roles
# --------------------------------------------------------------------------------------------

# --------------------------------------------------------------------------------------------
# Multiple role creation
# --------------------------------------------------------------------------------------------
resource "aws_iam_role" "iam-role" {
  count              = !var.required ? 0 : length(var.roles)
  name               = lookup(var.roles[count.index], "name")
  path               = var.path
  description        = "Terraform - ${lookup(var.roles[count.index], "description")}"
  assume_role_policy = lookup(var.roles[count.index], "assume_role_policy")
}

resource "aws_iam_role_policy_attachment" "iam-role" {
  count      = !var.required ? 0 : length(var.roles)
  role       = lookup(var.roles[count.index], "name")
  policy_arn = lookup(var.roles[count.index], "policy_arn")
  depends_on = [aws_iam_role.iam-role]
}

# --------------------------------------------------------------------------------------------

