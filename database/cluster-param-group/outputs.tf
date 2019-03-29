# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

# DB cluster parameter Group
output "arn" {
  description = "The ARN of the DB cluster parameter group"
  value       = "${join("", aws_rds_cluster_parameter_group.this.*.arn)}"
}

output "id" {
  description = "The id of the DB cluster parameter group"
  value       = "${join("", aws_rds_cluster_parameter_group.this.*.id)}"
}

output "name" {
  description = "The name of the DB cluster parameter group"
  value       = "${join("", aws_rds_cluster_parameter_group.this.*.name)}"
}
