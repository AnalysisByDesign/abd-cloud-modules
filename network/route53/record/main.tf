# -----------------------------------------------------------------------------
# Route53 Regular Record
# -----------------------------------------------------------------------------

resource "aws_route53_record" "this" {
  count = "${var.required}"

  zone_id = "${var.zone_id}"
  name    = "${var.name}"
  type    = "${var.type}"

  ttl     = "${var.ttl}"
  records = ["${var.records}"]

  lifecycle {
    create_before_destroy = true
  }
}
