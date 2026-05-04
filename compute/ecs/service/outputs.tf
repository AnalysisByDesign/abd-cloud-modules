################################################################
#
# CORE:
# SERVICE: OUTPUTS.TF SERVICE .
# Provides an ECS service - effectively a task that is expected to run until an error occurs or a user terminates it (typically a webserver or a database).
#
################################################################

output "aws_ecs_service_id" {
  value = aws_ecs_service.this.id
}
