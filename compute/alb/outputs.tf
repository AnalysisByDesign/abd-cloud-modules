# Provides a Target Group resource for use with App Load Balancer resources.
# CORE: outputs.tf

output "target_group_id" {
  value = "${aws_alb_target_group.this.id}"
}

output "target_group_arn" {
  value = "${aws_alb_target_group.this.arn}"
}

output "taraget_group_name" {
  value = "${aws_alb_target_group.this.name}"
}

output "aws_alb_listener_arn" {
  value = "${aws_alb_listener.actual.arn}"
}

output "aws_alb_listener_id" {
  value = "${aws_alb_listener.actual.id}"
}

output "alb_dns_name" {
  value = "${aws_alb.this.dns_name}"
}

output "alb_zone_id" {
  value = "${aws_alb.this.zone_id}"
}
