################################################################
#
# CORE:
# TASK: MAIN.TF TASK .
# Provides an ECS task definition to be used in aws_ecs_service.
#
################################################################

resource "aws_ecs_task_definition" "this" {
  family                   = "${var.family}"
  container_definitions    = "${var.container_definitions}"
  requires_compatibilities = ["${var.requires_compatibilities}"]
  network_mode             = "${var.network_mode}"
  cpu                      = "${var.cpu}"
  memory                   = "${var.memory}"
  execution_role_arn       = "${var.role_arn}"
  task_role_arn            = "${var.role_arn}"
}
