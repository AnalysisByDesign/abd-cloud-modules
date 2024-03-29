# -----------------------------------------------------------------------------
# Route53 ALIAS Record
# -----------------------------------------------------------------------------

resource "aws_route53_record" "alias" {
  zone_id = var.zone_id
  name    = var.name
  type    = "A"

  alias = {
    name                   = "${var.alias_name}"
    zone_id                = "${var.alias_zone_id}"
    evaluate_target_health = "${var.alias_evaluate_target_health}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
