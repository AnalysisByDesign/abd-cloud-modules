# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

# EFS
output "id" {
  description = "The ID of the EFS volume"
  value       = aws_efs_file_system.this.id
}

output "kms_key_id" {
  description = "The KMS key ID of the EFS volume"
  value       = aws_efs_file_system.this.kms_key_id
}

output "dns_name" {
  description = "The DNS name of the EFS volume"
  value       = aws_efs_file_system.this.dns_name
}
