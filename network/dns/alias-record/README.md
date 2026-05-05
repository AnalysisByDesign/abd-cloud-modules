# network/dns/alias-record

Creates a Route53 alias record (A or AAAA) pointing to an AWS resource such as an ALB, CloudFront distribution, or S3 website endpoint.

## Overview

Alias records are preferred over CNAME records for AWS resource targets because they have no TTL cost, resolve correctly at the zone apex, and automatically track the target's IP addresses. The `alias_zone_id` must be the hosted zone ID of the target resource, not the domain's hosted zone.

## Usage

```hcl
module "alb_alias" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//network/dns/alias-record?ref=v1.0.0"

  zone_id                    = module.public_zone.zone_id
  name                       = "example.co.uk"
  alias_name                 = module.alb.dns_name
  alias_zone_id              = module.alb.zone_id
  alias_evaluate_target_health = true
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
