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
| [aws_route53_record.alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_alias_evaluate_target_health"></a> [alias\_evaluate\_target\_health](#input\_alias\_evaluate\_target\_health) | Evaluate target domain name health | `bool` | `false` | no |
| <a name="input_alias_name"></a> [alias\_name](#input\_alias\_name) | Alias target domain name | `string` | n/a | yes |
| <a name="input_alias_zone_id"></a> [alias\_zone\_id](#input\_alias\_zone\_id) | Alias target domain name zone id | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the Route53 record | `string` | n/a | yes |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | The name of the Route53 zone to build the record in | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | The FQDN of the record |
| <a name="output_hosted_zone_id"></a> [hosted\_zone\_id](#output\_hosted\_zone\_id) | n/a |
<!-- END_TF_DOCS -->
