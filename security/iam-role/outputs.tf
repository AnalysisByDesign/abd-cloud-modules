# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

output "name" {
  description = "Name of the role"
  value       = "${ join("", aws_iam_role.singular.*.name) }"
}

output "arn" {
  description = "ARN of the role"
  value       = "${ join("", aws_iam_role.singular.*.arn) }"
}

output "names" {
  description = "Names of the roles"
  value       = "${ join(",", aws_iam_role.multiple.*.name) }"
}

output "arns" {
  description = "ARNs of the roles"
  value       = "${ join(",", aws_iam_role.multiple.*.arn) }"
}
