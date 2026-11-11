# -----------------------------------------------------------------------------
# Auto-scaling group
# -----------------------------------------------------------------------------

resource "aws_autoscaling_group" "asg" {
  name = var.name

  vpc_zone_identifier = var.subnet_ids

  # launch_configuration = "${var.launch_configuration}"

  launch_template {
    id      = var.launch_template_id
    version = var.launch_template_version
  }
  min_size                  = var.min_size
  desired_capacity          = var.desired_capacity
  max_size                  = var.max_size
  default_cooldown          = var.default_cooldown
  health_check_grace_period = var.health_check_grace_period
  wait_for_capacity_timeout = var.capacity_timeout
  target_group_arns         = var.target_group_arns
  health_check_type         = var.health_check_type
  force_delete              = var.force_delete
  termination_policies      = var.termination_policies
  protect_from_scale_in     = var.protect_from_scale_in
  dynamic "tag" {
    for_each = var.tag_map
    content {
      key                 = tag.value["key"]
      value               = tag.value["value"]
      propagate_at_launch = tag.value["propagate_at_launch"]
    }
  }
  enabled_metrics = var.enabled_metrics
  dynamic "instance_refresh" {
    for_each = var.enable_instance_refresh ? [1] : []
    content {
      strategy = "Rolling"
      preferences {
        min_healthy_percentage = var.instance_refresh_min_healthy_percentage
        max_healthy_percentage = var.instance_refresh_max_healthy_percentage
        instance_warmup        = var.instance_refresh_instance_warmup

        # null keeps the provider default (Ignore); ECS hosts with managed termination
        # protection need Refresh, or a refresh skips every host
        scale_in_protected_instances = var.instance_refresh_scale_in_protected_instances
      }
      triggers = var.instance_refresh_triggers
    }
  }
  dynamic "initial_lifecycle_hook" {
    for_each = var.initial_lifecycle_hooks
    content {
      name                    = initial_lifecycle_hook.value["name"]
      lifecycle_transition    = initial_lifecycle_hook.value["lifecycle_transition"]
      default_result          = initial_lifecycle_hook.value["default_result"]
      heartbeat_timeout       = initial_lifecycle_hook.value["heartbeat_timeout"]
      notification_metadata   = initial_lifecycle_hook.value["notification_metadata"]
      notification_target_arn = initial_lifecycle_hook.value["notification_target_arn"]
      role_arn                = initial_lifecycle_hook.value["role_arn"]
    }
  }
  lifecycle {
    create_before_destroy = true
  }
  timeouts {
    delete = var.delete_timeout
  }
}
