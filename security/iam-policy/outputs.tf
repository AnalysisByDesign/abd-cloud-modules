# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

output "name" {
  description = "Name of the policy"
  value       = join("", aws_iam_policy.this.*.name)
}

output "arn" {
  description = "ARN of the policy"
  value       = join("", aws_iam_policy.this.*.arn)
}
