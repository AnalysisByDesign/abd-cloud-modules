# --------------------------------------------------------------------------------------------
# Security Group Rule - CIDR
# --------------------------------------------------------------------------------------------

resource "aws_security_group_rule" "this" {
  count = var.required ? 1 : 0

  security_group_id = var.security_group_id
  type              = var.type
  protocol          = var.protocol
  cidr_blocks       = var.cidr_blocks
  from_port         = var.single_port != "" ? var.single_port : var.from_port
  to_port           = var.single_port != "" ? var.single_port : var.to_port

  description = "Terraform - ${var.description}"
}
