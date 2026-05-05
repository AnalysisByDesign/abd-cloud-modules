# network/dns/private-zone

Creates a Route53 private hosted zone associated with one or more VPCs for internal DNS resolution.

## Overview

The primary VPC association is defined inline on the zone resource. Additional VPC associations can be managed separately using the `network/dns/zone-association` module. The `lifecycle { ignore_changes = [vpc] }` block prevents Terraform from removing associations added outside of the zone's own configuration.

## Usage

```hcl
module "private_zone" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//network/dns/private-zone?ref=v1.0.0"

  search_domain = "internal.example.co.uk"
  vpc_id        = module.vpc.vpc_id
  common_tags   = local.common_tags
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
