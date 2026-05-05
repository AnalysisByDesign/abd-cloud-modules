# storage/efs

Creates an EFS file system with mount targets in each supplied subnet and a Route53 DNS record pointing to the file system's DNS name.

## Overview

The file system is created with configurable performance mode and optional KMS encryption. Mount targets are created for each subnet ID in the `subnet_ids` list, making the file system accessible from instances in those subnets. A Route53 CNAME record is created in the specified private hosted zone to provide a stable, human-readable endpoint.

## Usage

```hcl
module "shared_storage" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//storage/efs?ref=v1.0.0"

  name             = "wordpress-media"
  subnet_ids       = module.vpc.private_subnet_ids
  security_group_ids = [module.efs_sg.id]
  zone_id          = module.dns.private_zone_id
  common_tags      = local.common_tags
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
