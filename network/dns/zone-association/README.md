# network/dns/zone-association

Associates an additional VPC with an existing Route53 private hosted zone, enabling DNS resolution of that zone from the newly associated VPC.

## Overview

Used to extend a private zone to cover VPCs that were not declared in the zone's initial `vpc` block — for example, associating the services VPC's private zone with the WordPress VPC after VPC peering is established.

## Usage

```hcl
module "zone_association" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//network/dns/zone-association?ref=v1.0.0"

  zone_id = module.private_zone.zone_id
  vpc_id  = module.peered_vpc.vpc_id
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
