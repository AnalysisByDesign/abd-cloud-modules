# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

# Elastic Load Balancer
output "id" {
  description = "The ID of the Elastic Load Balancer"
  value       = "${aws_elb.elb.id}"
}

output "arn" {
  description = "The arn of the Elastic Load Balancer"
  value       = "${aws_elb.elb.arn}"
}

output "name" {
  description = "The name of the Elastic Load Balancer"
  value       = "${aws_elb.elb.name}"
}

output "dns_name" {
  description = "The DNS name of the Elastic Load Balancer"
  value       = "${aws_elb.elb.dns_name}"
}

output "instances" {
  description = "The instances attached to the LB"
  value       = "${aws_elb.elb.instances}"
}

output "source_security_group_id" {
  description = "The security group id to be used for inbound to backend instances"
  value       = "${aws_elb.elb.source_security_group_id}"
}

output "zone_id" {
  description = "The hosted zone id of the LB"
  value       = "${aws_elb.elb.zone_id}"
}
