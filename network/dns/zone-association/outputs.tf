# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

# Route53 Zone Association
output "id" {
  description = "The ID of the zone association"
  value       = "${aws_route53_zone_association.this.id}"
}

output "zone_id" {
  description = "The zone ID of the zone association"
  value       = "${aws_route53_zone_association.this.zone_id}"
}

output "vpc_id" {
  description = "The VPC ID of the zone association"
  value       = "${aws_route53_zone_association.this.vpc_id}"
}

output "vpc_region" {
  description = "The region of the associated VPC"
  value       = "${aws_route53_zone_association.this.vpc_region}"
}
