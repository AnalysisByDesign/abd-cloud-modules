# -----------------------------------------------------------------------------
# Auto-scaling group
# -----------------------------------------------------------------------------

resource "aws_autoscaling_group" "asg" {
  name = var.name

  vpc_zone_identifier = ["${var.subnet_ids}"]

  # launch_configuration = "${var.launch_configuration}"

  launch_template = {
    id      = "${var.launch_template_id}"
    version = "$$Latest"
  }
  min_size                  = var.min_size
  desired_capacity          = var.desired_capacity
  max_size                  = var.max_size
  default_cooldown          = var.default_cooldown
  health_check_grace_period = var.health_check_grace_period
  wait_for_capacity_timeout = var.capacity_timeout
  target_group_arns         = ["${var.target_group_arns}"]
  health_check_type         = var.health_check_type
  force_delete              = var.force_delete
  termination_policies      = ["${var.termination_policies}"]
  tags                      = ["${var.tag_map}"]
  enabled_metrics           = ["${var.enabled_metrics}"]
  lifecycle {
    create_before_destroy = true
  }
  timeouts {
    delete = var.delete_timeout
  }
}
