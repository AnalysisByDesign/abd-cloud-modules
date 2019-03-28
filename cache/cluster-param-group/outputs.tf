# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

# Elasticache cluster parameter Group

output "id" {
  description = "The id of the Elasticache cluster parameter group"
  value       = "${join("", aws_elasticache_parameter_group.this.*.id)}"
}

output "name" {
  description = "The name of the Elasticache cluster parameter group"
  value       = "${join("", aws_elasticache_parameter_group.this.*.name)}"
}
