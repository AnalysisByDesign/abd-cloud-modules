# network/dns/public-zone

Creates one or more Route53 public hosted zones. Supports a single zone name or a list of search domains for batch creation.

## Overview

When `search_domains` is provided, one zone is created per domain in the list. When only `search_domain` (singular) is provided, `coalescelist` falls back to that single value. Zone outputs are comma-joined strings of IDs and lists of name server arrays, allowing callers to extract per-zone values.

## Usage

```hcl
module "public_zone" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//network/dns/public-zone?ref=v1.0.0"

  search_domain = "example.co.uk"
  common_tags   = local.common_tags
}
```

Multiple zones:

```hcl
module "public_zones" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//network/dns/public-zone?ref=v1.0.0"

  search_domains = ["example.co.uk", "example.com"]
  common_tags    = local.common_tags
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
| <a name="input_delegation_set_id"></a> [delegation\_set\_id](#input\_delegation\_set\_id) | The delegation set id to build the public zone for | `string` | n/a | yes |
| <a name="input_r53_tags"></a> [r53\_tags](#input\_r53\_tags) | Additional tags for the Route53 zone | `map(string)` | `{}` | no |
| <a name="input_search_domain"></a> [search\_domain](#input\_search\_domain) | The search domain to create a public zone for | `string` | `""` | no |
| <a name="input_search_domains"></a> [search\_domains](#input\_search\_domains) | A list of search domains to create a public zones for | `list(string)` | `[]` | no |
| <a name="input_use_existing_zones"></a> [use\_existing\_zones](#input\_use\_existing\_zones) | Re-use existing public and private zones | `bool` | `false` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_name_servers"></a> [name\_servers](#output\_name\_servers) | The Name Servers of the zones |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | The ID of the zones |
<!-- END_TF_DOCS -->
