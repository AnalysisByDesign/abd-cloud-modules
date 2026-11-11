################################################################
#
# CORE:
# SERVICE: MAIN.TF SERVICE .
# Provides an ECS service - effectively a task that is expected to run until an error occurs or a user terminates it (typically a webserver or a database).
#
################################################################

# Two copies of the same service, one of which is created. A lifecycle block cannot be
# conditional, so the CI-managed copy is the one that ignores task_definition: CI registers
# new revisions and updates the service, and Terraform only sets the first revision.
# Moving a service between the two needs a `terraform state mv`.

locals {
  # A capacity provider strategy and a launch type are mutually exclusive
  launch_type = length(var.capacity_provider_strategy) > 0 ? null : var.launch_type
}

resource "aws_ecs_service" "this" {
  count = var.task_definition_managed_externally ? 0 : 1

  name                               = var.name
  cluster                            = var.cluster_id
  task_definition                    = var.task_definition
  desired_count                      = var.desired_count
  scheduling_strategy                = var.scheduling_strategy
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  deployment_maximum_percent         = var.deployment_maximum_percent
  launch_type                        = local.launch_type
  health_check_grace_period_seconds  = var.health_check_grace_period_seconds
  enable_execute_command             = var.enable_execute_command
  enable_ecs_managed_tags            = true
  propagate_tags                     = "SERVICE"
  wait_for_steady_state              = var.wait_for_steady_state

  deployment_circuit_breaker {
    enable   = var.deployment_circuit_breaker
    rollback = var.deployment_circuit_breaker
  }

  dynamic "capacity_provider_strategy" {
    for_each = var.capacity_provider_strategy
    content {
      capacity_provider = capacity_provider_strategy.value.capacity_provider
      weight            = capacity_provider_strategy.value.weight
      base              = capacity_provider_strategy.value.base
    }
  }

  # awsvpc network mode only
  dynamic "network_configuration" {
    for_each = length(var.subnet_ids) > 0 ? [1] : []
    content {
      security_groups  = var.security_group_ids
      subnets          = var.subnet_ids
      assign_public_ip = false
    }
  }

  dynamic "load_balancer" {
    for_each = var.load_balancers
    content {
      target_group_arn = load_balancer.value.target_group_arn
      container_name   = load_balancer.value.container_name
      container_port   = load_balancer.value.container_port
    }
  }

  dynamic "service_registries" {
    for_each = var.service_registries
    content {
      registry_arn   = service_registries.value.registry_arn
      port           = service_registries.value.port
      container_name = service_registries.value.container_name
      container_port = service_registries.value.container_port
    }
  }

  dynamic "placement_constraints" {
    for_each = var.placement_constraints
    content {
      type       = placement_constraints.value.type
      expression = placement_constraints.value.expression
    }
  }

  dynamic "ordered_placement_strategy" {
    for_each = var.ordered_placement_strategy
    content {
      type  = ordered_placement_strategy.value.type
      field = ordered_placement_strategy.value.field
    }
  }

  tags = merge(var.common_tags, var.service_tags, { Name = var.name })
}

resource "aws_ecs_service" "ci_managed" {
  count = var.task_definition_managed_externally ? 1 : 0

  name                               = var.name
  cluster                            = var.cluster_id
  task_definition                    = var.task_definition
  desired_count                      = var.desired_count
  scheduling_strategy                = var.scheduling_strategy
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  deployment_maximum_percent         = var.deployment_maximum_percent
  launch_type                        = local.launch_type
  health_check_grace_period_seconds  = var.health_check_grace_period_seconds
  enable_execute_command             = var.enable_execute_command
  enable_ecs_managed_tags            = true
  propagate_tags                     = "SERVICE"
  wait_for_steady_state              = var.wait_for_steady_state

  deployment_circuit_breaker {
    enable   = var.deployment_circuit_breaker
    rollback = var.deployment_circuit_breaker
  }

  dynamic "capacity_provider_strategy" {
    for_each = var.capacity_provider_strategy
    content {
      capacity_provider = capacity_provider_strategy.value.capacity_provider
      weight            = capacity_provider_strategy.value.weight
      base              = capacity_provider_strategy.value.base
    }
  }

  # awsvpc network mode only
  dynamic "network_configuration" {
    for_each = length(var.subnet_ids) > 0 ? [1] : []
    content {
      security_groups  = var.security_group_ids
      subnets          = var.subnet_ids
      assign_public_ip = false
    }
  }

  dynamic "load_balancer" {
    for_each = var.load_balancers
    content {
      target_group_arn = load_balancer.value.target_group_arn
      container_name   = load_balancer.value.container_name
      container_port   = load_balancer.value.container_port
    }
  }

  dynamic "service_registries" {
    for_each = var.service_registries
    content {
      registry_arn   = service_registries.value.registry_arn
      port           = service_registries.value.port
      container_name = service_registries.value.container_name
      container_port = service_registries.value.container_port
    }
  }

  dynamic "placement_constraints" {
    for_each = var.placement_constraints
    content {
      type       = placement_constraints.value.type
      expression = placement_constraints.value.expression
    }
  }

  dynamic "ordered_placement_strategy" {
    for_each = var.ordered_placement_strategy
    content {
      type  = ordered_placement_strategy.value.type
      field = ordered_placement_strategy.value.field
    }
  }

  tags = merge(var.common_tags, var.service_tags, { Name = var.name })

  lifecycle {
    ignore_changes = [task_definition]
  }
}
