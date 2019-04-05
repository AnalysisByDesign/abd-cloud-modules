# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

# EC2 instance
output "id" {
  description = "The id of the EC2 instance"
  value       = "${aws_instance.ec2.id}"
}

output "private_ip" {
  description = "The private IP address of the EC2 instance"
  value       = "${aws_instance.ec2.private_ip}"
}

output "public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = "${aws_instance.ec2.public_ip}"
}
