# -----------------------------------------------------------------------------
# Elastic Load Balancer
# -----------------------------------------------------------------------------

resource "aws_lb" "nlb" {
  load_balancer_type = "network"
  name               = var.name
  internal           = true
  subnets            = ["${var.subnet_ids}"]

  enable_cross_zone_load_balancing = var.cross_zone_load_balancing

  tags = merge(var.common_tags, var.lb_tags, map("Name", format("%s", var.name)))
}

resource "aws_lb_target_group" "nlb" {
  name   = var.name
  vpc_id = var.vpc_id

  port     = var.ingress_port
  protocol = "TCP"

  target_type = var.target_type
  slow_start  = var.slow_start

  health_check {
    interval = var.healthcheck_interval
    port     = var.instance_port
    protocol = var.protocol

    healthy_threshold   = var.healthcheck_healthy_threshold
    unhealthy_threshold = var.healthcheck_unhealthy_threshold
  }

  tags = merge(var.common_tags, map("Name", format("%s", var.name)))
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = var.ingress_port
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.nlb.arn
    type             = "forward"
  }
}
