# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

# Route53
output "zone_id" {
  description = "The ID of the zones"
  value       = "${join(",", aws_route53_zone.this.*.zone_id)}"
}

output "name_servers" {
  description = "The Name Servers of the zones"
  value       = ["${aws_route53_zone.this.*.name_servers}"]
}
