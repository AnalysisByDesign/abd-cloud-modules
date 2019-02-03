# -----------------------------------------------------------------------------
# Route53 Delegation Set
# -----------------------------------------------------------------------------

resource "aws_route53_delegation_set" "this" {
  count          = "${var.use_existing_zones ? 0 : 1}"
  reference_name = "${var.delegate_set_name}"
}
