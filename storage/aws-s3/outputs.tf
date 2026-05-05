# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

output "id" {
  description = "The ID of the S3 bucket"
  value       = var.create_bucket ? aws_s3_bucket.bucket[0].id : ""
}

output "arn" {
  description = "The ARN of the S3 bucket"
  value       = var.create_bucket ? aws_s3_bucket.bucket[0].arn : ""
}

output "bucket_domain_name" {
  description = "The domain name of the S3 bucket"
  value       = var.create_bucket ? aws_s3_bucket.bucket[0].bucket_domain_name : ""
}

output "bucket_regional_domain_name" {
  description = "The regional domain name of the S3 bucket"
  value       = var.create_bucket ? aws_s3_bucket.bucket[0].bucket_regional_domain_name : ""
}

output "hosted_zone_id" {
  description = "The Route53 hosted zone ID of the S3 bucket"
  value       = var.create_bucket ? aws_s3_bucket.bucket[0].hosted_zone_id : ""
}
