# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

output "id" {
  description = "Id of the security group"
  value       = "${aws_security_group.this.id}"
}

output "name" {
  description = "Name of the security group"
  value       = "${aws_security_group.this.name}"
}

output "arn" {
  description = "ARN of the security group"
  value       = "${aws_security_group.this.arn}"
}

output "vpc_id" {
  description = "VPC_id of the security group"
  value       = "${aws_security_group.this.vpc_id}"
}
