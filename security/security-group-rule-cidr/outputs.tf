# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

output "id" {
  description = "Id of the security group"
  value       = "${join("", aws_security_group_rule.this.*.id)}"
}

output "description" {
  description = "Description of the security group"
  value       = "${join("", aws_security_group_rule.this.*.description)}"
}
