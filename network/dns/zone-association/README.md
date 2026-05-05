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
## Requirements

No requirements.

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_route53_zone_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC id to attach the private zone to | `string` | n/a | yes |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | The Route53 zone id to associate the VPC with | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_id"></a> [id](#output\_id) | The ID of the zone association |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The VPC ID of the zone association |
| <a name="output_vpc_region"></a> [vpc\_region](#output\_vpc\_region) | The region of the associated VPC |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | The zone ID of the zone association |
<!-- END_TF_DOCS -->
