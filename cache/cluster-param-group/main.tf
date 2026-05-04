# -----------------------------------------------------------------------------
# elasticache-parameter-group.tf
# -----------------------------------------------------------------------------

resource "aws_elasticache_parameter_group" "this" {
  count = var.count

  name        = var.name
  family      = var.elasticache_family
  description = "Terraform - ${var.description}"

  parameter {
    name  = "activerehashing"
    value = var.activerehashing
  }
}
