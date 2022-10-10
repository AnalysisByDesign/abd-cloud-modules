################################################################
#
# CORE:
# TASK: OUTPUTS.TF TASK .
# Provides an ECS task definition to be used in aws_ecs_service.
#
################################################################

output "defininition_id" {
  value = aws_ecs_task_definition.this.id
}

output "definition_arn" {
  value = aws_ecs_task_definition.this.arn
}

output "role_arn" {
  value = aws_ecs_task_definition.this.task_role_arn
}

output "family" {
  value = aws_ecs_task_definition.this.family
}

output "definition_revision" {
  value = aws_ecs_task_definition.this.revision
}
