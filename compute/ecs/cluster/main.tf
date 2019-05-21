################################################################
#
# CORE: MAIN.TF Cluster.
# Provides an ECS cluster.
#
################################################################

resource "aws_ecs_cluster" "this" {
  name = "${var.name}"
}
