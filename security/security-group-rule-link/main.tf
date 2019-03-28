# --------------------------------------------------------------------------------------------
# Security Group Rule - Link
# --------------------------------------------------------------------------------------------

resource "aws_security_group_rule" "this" {
  count = "${var.required ? 1 : 0}"

  security_group_id        = "${var.security_group_id}"
  type                     = "${var.type}"
  protocol                 = "${var.protocol}"
  source_security_group_id = "${var.source_security_group_id}"
  from_port                = "${var.single_port != "" ? var.single_port : var.from_port}"
  to_port                  = "${var.single_port != "" ? var.single_port : var.to_port}"

  description = "Terraform - ${var.description}"
}
