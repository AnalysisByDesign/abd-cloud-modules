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
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_r53_tags"></a> [r53\_tags](#input\_r53\_tags) | Additional tags for the Route53 zone | `map(string)` | `{}` | no |
| <a name="input_search_domain"></a> [search\_domain](#input\_search\_domain) | The domain name of the Route53 Zone | `string` | `""` | no |
| <a name="input_search_domains"></a> [search\_domains](#input\_search\_domains) | A list of search domains to create a public zones for | `list(string)` | `[]` | no |
| <a name="input_use_existing_zones"></a> [use\_existing\_zones](#input\_use\_existing\_zones) | Re-use existing public and private zones | `bool` | `false` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC id to attach the private zone to | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_name_servers"></a> [name\_servers](#output\_name\_servers) | The Name Servers of the zones |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | The ID of the zones |
<!-- END_TF_DOCS -->
