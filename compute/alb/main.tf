# Provides a Target Group resource for use with App Load Balancer resources.
# CORE: main.tf

resource "aws_alb" "this" {
  name               = "${var.name}"
  internal           = "${var.internal}"
  load_balancer_type = "application"
  security_groups    = ["${var.security_group_ids}"]
  subnets            = ["${var.subnet_ids}"]

  #  access_logs {
  #    bucket  = "${aws_s3_bucket.lb_logs.bucket}"
  #    prefix  = "test-lb"
  #    enabled = true
  #  }

  tags = "${merge(var.common_tags, var.alb_tags, map("Name", format("%s", var.name)))}"
}

resource "aws_lb_listener" "redirect" {
  load_balancer_arn = "${aws_alb.this.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_alb_listener" "actual" {
  load_balancer_arn = "${aws_alb.this.arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2015-05"
  certificate_arn   = "${var.acm_arn}"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.this.arn}"
  }
}

resource "aws_alb_target_group" "this" {
  name        = "${var.name}"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "${var.vpc_id}"
  target_type = "instance"

  health_check {
    interval            = "${var.interval}"
    path                = "${var.path}"
    port                = "80"
    protocol            = "HTTP"
    timeout             = "${var.timeout}"
    unhealthy_threshold = "${var.unhealthy_threshold}"
    healthy_threshold   = "${var.healthy_threshold}"
    matcher             = "${var.success_code}"
  }

  stickiness {
    type    = "lb_cookie"
    enabled = "${var.stickiness_enabled}"
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = ["aws_alb.this"]
  tags       = "${merge(var.common_tags, var.alb_tags, map("Name", format("%s", var.name)))}"
}

resource "aws_wafregional_web_acl_association" "this" {
  count        = "${var.waf_enabled ? 1 : 0}"
  depends_on   = ["aws_alb.this"]
  resource_arn = "${aws_alb.this.arn}"
  web_acl_id   = "${var.waf_web_acl}"
}
