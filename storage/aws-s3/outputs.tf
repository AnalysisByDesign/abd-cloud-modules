# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

# S3
output "id" {
  description = "The ID of the S3 bucket"
  value       = "${join("", aws_s3_bucket.bucket.*.id)}"
}

output "arn" {
  description = "The ARN of the S3 bucket"
  value       = "${join("", aws_s3_bucket.bucket.*.arn)}"
}

output "bucket_domain_name" {
  description = "The domain name of the S3 bucket"
  value       = "${join("", aws_s3_bucket.bucket.*.bucket_domain_name)}"
}

output "bucket_regional_domain_name" {
  description = "The regional domain name of the S3 bucket"
  value       = "${join("", aws_s3_bucket.bucket.*.bucket_regional_domain_name)}"
}

output "hosted_zone_id" {
  description = "The R53 hosted zone id of the S3 bucket"
  value       = "${join("", aws_s3_bucket.bucket.*.hosted_zone_id)}"
}
