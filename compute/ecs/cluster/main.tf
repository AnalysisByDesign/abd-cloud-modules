# -----------------------------------------------------------------------------
# ECS Cluster
# -----------------------------------------------------------------------------

resource "aws_ecs_cluster" "this" {
  name = var.name

  setting {
    name  = "containerInsights"
    value = var.ecs_insights
  }

  tags = merge(var.common_tags, var.ecs_tags, { Name = var.name })
}

# -----------------------------------------------------------------------------
# EC2 capacity providers (optional), one per Auto Scaling group
# -----------------------------------------------------------------------------

resource "aws_ecs_capacity_provider" "this" {
  for_each = var.capacity_providers

  name = each.key

  auto_scaling_group_provider {
    auto_scaling_group_arn = each.value.auto_scaling_group_arn

    # ENABLED needs the ASG's new instances protected from scale in
    managed_termination_protection = each.value.managed_termination_protection
    managed_draining               = each.value.managed_draining

    managed_scaling {
      status                    = each.value.managed_scaling
      target_capacity           = each.value.target_capacity
      minimum_scaling_step_size = each.value.minimum_scaling_step_size
      maximum_scaling_step_size = each.value.maximum_scaling_step_size
      instance_warmup_period    = each.value.instance_warmup_period
    }
  }

  tags = merge(var.common_tags, var.ecs_tags, { Name = each.key })
}

# The cluster's provider list and default strategy. One resource per cluster, so it is
# only created when this module owns at least one capacity provider.
resource "aws_ecs_cluster_capacity_providers" "this" {
  count = length(var.capacity_providers) > 0 ? 1 : 0

  cluster_name       = aws_ecs_cluster.this.name
  capacity_providers = [for k, v in aws_ecs_capacity_provider.this : v.name]

  dynamic "default_capacity_provider_strategy" {
    for_each = var.default_capacity_provider_strategy
    content {
      capacity_provider = aws_ecs_capacity_provider.this[default_capacity_provider_strategy.value.capacity_provider].name
      weight            = default_capacity_provider_strategy.value.weight
      base              = default_capacity_provider_strategy.value.base
    }
  }
}
