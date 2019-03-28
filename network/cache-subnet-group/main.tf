# -----------------------------------------------------------------------------
# elasticache-subnet-group.tf
# -----------------------------------------------------------------------------
resource "aws_elasticache_subnet_group" "this" {
  count = "${var.count}"

  name        = "${var.name}"
  subnet_ids  = ["${var.subnet_ids}"]
  description = "Terraform - ${var.description}"
}
