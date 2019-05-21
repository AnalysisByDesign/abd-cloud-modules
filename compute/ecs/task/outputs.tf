################################################################
#
# CORE:
# TASK: OUTPUTS.TF TASK .
# Provides an ECS task definition to be used in aws_ecs_service.
#
################################################################

output "task_defeninition_id" {
  value = "${aws_ecs_task_definition.this.id}"
}

output "task_defenition_arn" {
  value = "${aws_ecs_task_definition.this.arn}"
}

output "task_role_arn" {
  value = "${aws_ecs_task_definition.this.task_role_arn}"
}

output "task_family" {
  value = "${aws_ecs_task_definition.this.family}"
}

output "task_definition_revision" {
  value = "${aws_ecs_task_definition.this.revision}"
}
