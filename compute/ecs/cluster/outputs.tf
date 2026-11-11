# -----------------------------------------------------------------------------
# ECS Cluster
# -----------------------------------------------------------------------------

output "cluster_name" {
  value = aws_ecs_cluster.this.name
}

output "cluster_id" {
  value = aws_ecs_cluster.this.id
}

output "cluster_arn" {
  value = aws_ecs_cluster.this.arn
}

output "capacity_provider_names" {
  description = "Names of the capacity providers this module created"
  value       = [for k, v in aws_ecs_capacity_provider.this : v.name]
}
