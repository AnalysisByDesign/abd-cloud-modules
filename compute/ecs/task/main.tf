################################################################
#
# CORE:
# TASK: MAIN.TF TASK .
# Provides an ECS task definition to be used in aws_ecs_service.
#
################################################################

locals {
  # role_arn is the original single role, still used for both when the split roles are unset
  legacy_role_arn    = var.role_arn == "" ? null : var.role_arn
  execution_role_arn = var.execution_role_arn != null ? var.execution_role_arn : local.legacy_role_arn
  task_role_arn      = var.task_role_arn != null ? var.task_role_arn : local.legacy_role_arn
}

resource "aws_ecs_task_definition" "this" {
  family                   = var.family
  container_definitions    = var.container_definitions
  requires_compatibilities = var.requires_compatibilities == "" ? null : [var.requires_compatibilities]
  network_mode             = var.network_mode == "" ? null : var.network_mode
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = local.execution_role_arn
  task_role_arn            = local.task_role_arn
  skip_destroy             = var.skip_destroy

  dynamic "runtime_platform" {
    for_each = var.cpu_architecture == null ? [] : [1]
    content {
      cpu_architecture        = var.cpu_architecture
      operating_system_family = "LINUX"
    }
  }

  dynamic "volume" {
    for_each = var.volumes
    content {
      name      = volume.value.name
      host_path = volume.value.host_path

      dynamic "efs_volume_configuration" {
        for_each = volume.value.efs == null ? [] : [volume.value.efs]
        content {
          file_system_id     = efs_volume_configuration.value.file_system_id
          root_directory     = efs_volume_configuration.value.access_point_id == null ? efs_volume_configuration.value.root_directory : null
          transit_encryption = "ENABLED"

          dynamic "authorization_config" {
            for_each = efs_volume_configuration.value.access_point_id == null ? [] : [1]
            content {
              access_point_id = efs_volume_configuration.value.access_point_id
              iam             = efs_volume_configuration.value.iam
            }
          }
        }
      }
    }
  }

  tags = merge(var.common_tags, var.task_tags, { Name = var.family })
}
