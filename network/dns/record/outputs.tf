# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

# Route53 record
output "fqdn" {
  description = "The FQDN of the record"
  value       = "${join("", aws_route53_record.this.*.fqdn)}"
}

output "hosted_zone_id" {
  value = "${join("", aws_route53_record.this.*.zone_id)}"
}

output "name" {
  value = "${join("", aws_route53_record.this.*.name)}"
}
