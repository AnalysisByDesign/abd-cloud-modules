# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

# Cache Subnet Group

output "id" {
  description = "The id of the Cache subnet group"
  value       = join("", aws_elasticache_subnet_group.this.*.id)
}

output "name" {
  description = "The name of the Cache parameter group"
  value       = join("", aws_elasticache_subnet_group.this.*.name)
}
