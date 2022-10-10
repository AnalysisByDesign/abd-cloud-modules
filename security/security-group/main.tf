# --------------------------------------------------------------------------------------------
# Security Group
# --------------------------------------------------------------------------------------------

resource "aws_security_group" "this" {
  name        = var.name
  description = "Terraform - ${var.description}"
  vpc_id      = var.vpc_id

  tags = (merge(var.common_tags, var.sg_tags,
  map("Name", var.name)))
}
