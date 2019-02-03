# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

# CloudWatch Log Groups
output "names_of_groups" {
  description = "List of the names of the log groups created"
  value       = "${aws_cloudwatch_log_group.this.*.name}"
}

output "groups_arn" {
  description = "List of the ARNs of the log groups created"
  value       = "${aws_cloudwatch_log_group.this.*.arn}"
}
