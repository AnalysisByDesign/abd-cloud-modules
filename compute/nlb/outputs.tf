# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

# Elastic Load Balancer
output "lb_id" {
  description = "The ID of the Elastic Load Balancer"
  value       = "${aws_lb.nlb.id}"
}

output "lb_arn" {
  description = "The arn of the Elastic Load Balancer"
  value       = "${aws_lb.nlb.arn}"
}

output "lb_arn_suffix" {
  description = "The arn suffix for CloudWatch metrics"
  value       = "${aws_lb.nlb.arn_suffix}"
}

output "lb_dns_name" {
  description = "The DNS name of the Elastic Load Balancer"
  value       = "${aws_lb.nlb.dns_name}"
}

output "lb_zone_id" {
  description = "The hosted zone id of the LB"
  value       = "${aws_lb.nlb.zone_id}"
}

# Target Group
output "tg_id" {
  description = "The ID of the Target Group"
  value       = "${aws_lb_target_group.nlb.id}"
}

output "tg_arn" {
  description = "The arn of the Target Group"
  value       = "${aws_lb_target_group.nlb.arn}"
}

output "tg_arn_suffix" {
  description = "The arn suffix for CloudWatch metrics"
  value       = "${aws_lb_target_group.nlb.arn_suffix}"
}
