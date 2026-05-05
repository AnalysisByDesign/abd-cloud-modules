# -----------------------------------------------------------------------------
# elasticache-parameter-group.tf
# -----------------------------------------------------------------------------

resource "aws_elasticache_parameter_group" "this" {
  name        = var.name
  family      = var.elasticache_family
  description = "Terraform - ${var.description}"

  parameter {
    name  = "activerehashing"
    value = var.activerehashing
  }
}
