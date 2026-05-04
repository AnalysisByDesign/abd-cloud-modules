# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

# Launch template
output "id" {
  description = "The ID of the launch template"
  value       = aws_launch_template.this.id
}

output "name" {
  description = "The name of the launch template"
  value       = aws_launch_template.this.name
}

output "latest_version" {
  description = "The latest version of the launch template"
  value       = aws_launch_template.this.latest_version
}
