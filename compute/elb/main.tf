# -----------------------------------------------------------------------------
# Elastic Load Balancer
# -----------------------------------------------------------------------------

resource "aws_elb" "elb" {
  name = var.name

  subnets         = ["${var.subnet_ids}"]
  security_groups = ["${var.security_group_ids}"]

  listener {
    lb_port           = var.lb_port
    lb_protocol       = var.lb_protocol
    instance_port     = var.instance_port
    instance_protocol = var.instance_protocol
  }

  health_check {
    healthy_threshold   = var.healthcheck_healthy_threshold
    unhealthy_threshold = var.healthcheck_unhealthy_threshold
    timeout             = var.healthcheck_timeout
    interval            = var.healthcheck_interval

    target = (var.healthcheck_target != ""
      ? var.healthcheck_target
    : "${var.instance_protocol}:${var.instance_port}")
  }

  cross_zone_load_balancing   = var.cross_zone_load_balancing
  idle_timeout                = var.idle_timeout
  connection_draining         = var.connection_draining
  connection_draining_timeout = var.connection_draining_timeout

  tags = merge(var.common_tags, var.elb_tags, map("Name", format("%s", var.name)))
}
