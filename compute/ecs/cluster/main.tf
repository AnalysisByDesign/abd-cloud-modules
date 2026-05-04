# -----------------------------------------------------------------------------
# ECS Cluster
# -----------------------------------------------------------------------------

resource "aws_ecs_cluster" "this" {
  name = var.name

  # setting {
  #   name  = "containerInsights"
  #   value = "${var.ecs_insights}"
  # }

  tags = merge(var.common_tags, var.ecs_tags, map("Name", format("%s", var.name)))
}
