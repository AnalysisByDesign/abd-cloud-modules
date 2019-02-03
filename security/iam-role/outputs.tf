# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

output "names" {
  description = "Names of the roles"
  value       = "${ join(",", aws_iam_role.iam-role.*.name) }"
}

output "arns" {
  description = "ARNs of the roles"
  value       = "${ join(",", aws_iam_role.iam-role.*.arn) }"
}
