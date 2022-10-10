# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

# DB Subnet Group
output "arn" {
  description = "The ARN of the DB subnet group"
  value       = join("", aws_db_subnet_group.this.*.arn)
}

output "id" {
  description = "The id of the DB subnet group"
  value       = join("", aws_db_subnet_group.this.*.id)
}

output "name" {
  description = "The name of the DB parameter group"
  value       = join("", aws_db_subnet_group.this.*.name)
}
