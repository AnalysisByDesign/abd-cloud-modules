################################################################
#
# CORE:
# SERVICE: OUTPUTS.TF SERVICE .
# Provides an ECS service - effectively a task that is expected to run until an error occurs or a user terminates it (typically a webserver or a database).
#
################################################################

locals {
  service = one(concat(aws_ecs_service.this, aws_ecs_service.ci_managed))
}

output "aws_ecs_service_id" {
  description = "The ARN of the service"
  value       = local.service.id
}

output "name" {
  description = "The name of the service"
  value       = local.service.name
}
