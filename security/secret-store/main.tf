# -----------------------------------------------------------------------------
# Prepare Secrets Store
# -----------------------------------------------------------------------------

resource "aws_ssm_parameter" "this" {
  count       = var.required ? 1 : 0
  name        = "/${var.key}"
  type        = var.type
  value       = var.value
  description = "Terraform - ${var.description}"
  tags        = var.tags

  # We don't want to reset the value if the user has changed it!
  lifecycle = {
    ignore_changes = ["value"]
  }
}
