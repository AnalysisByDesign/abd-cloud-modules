# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

# Route53 record

output "fqdn" {
  description = "The FQDN of the record"
  value       = "${aws_route53_record.alias.fqdn}"
}

output "hosted_zone_id" {
  value = "${aws_route53_record.alias.zone_id}"
}
