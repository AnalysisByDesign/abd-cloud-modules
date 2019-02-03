# -----------------------------------------------------------------------------
# Route53 Public Zone
# -----------------------------------------------------------------------------

resource "aws_route53_zone" "this" {
  count = "${length(local.search_domains) > 0
                    ? (var.use_existing_zones ? 0 : length(local.search_domains)) 
                    : 0}"

  name              = "${element(local.search_domains, count.index)}"
  delegation_set_id = "${var.delegation_set_id}"

  tags = "${merge(var.common_tags, 
                                var.r53_tags, 
                                map("Name", format("%s", element(local.search_domains, count.index))))}"
}

locals {
  # Route53 search domain lists for creating new Zones
  search_domains = "${coalescelist(var.search_domains, list(var.search_domain))}"
}
