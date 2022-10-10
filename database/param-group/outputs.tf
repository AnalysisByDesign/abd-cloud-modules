# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

# DB parameter Group
output "arn" {
  description = "The ARN of the DB parameter group"
  value       = join("", aws_db_parameter_group.this.*.arn)
}

output "id" {
  description = "The id of the DB parameter group"
  value       = join("", aws_db_parameter_group.this.*.id)
}

output "name" {
  description = "The name of the DB parameter group"
  value       = join("", aws_db_parameter_group.this.*.name)
}
