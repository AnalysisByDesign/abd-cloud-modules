# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

output "names" {
  description = "Names of the roles"
  value       = join(",", [for r in aws_iam_role.iam-role : r.name])
}

output "arns" {
  description = "ARNs of the roles"
  value       = join(",", [for r in aws_iam_role.iam-role : r.arn])
}
