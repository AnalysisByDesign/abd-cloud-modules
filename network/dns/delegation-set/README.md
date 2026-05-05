# network/dns/delegation-set

Creates a Route53 reusable delegation set that assigns a fixed set of name servers to hosted zones.

## Overview

A delegation set ensures that all zones referencing it share the same four Route53 name servers. This allows DNS nameserver records to be pre-registered with domain registrars before the hosted zone content exists, and means zone recreation does not require nameserver updates at the registrar.

## Usage

```hcl
module "delegation_set" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//network/dns/delegation-set?ref=v1.0.0"

  reference_name = "abd-global"
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
| [aws_route53_delegation_set.delegate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_delegation_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_delegate_set_name"></a> [delegate\_set\_name](#input\_delegate\_set\_name) | A reference name for the delegation set | `string` | `""` | no |
| <a name="input_use_existing_zones"></a> [use\_existing\_zones](#input\_use\_existing\_zones) | Re-use existing public and private zones | `bool` | `false` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_id"></a> [id](#output\_id) | The ID of the delegate set |
| <a name="output_name_servers"></a> [name\_servers](#output\_name\_servers) | The Name Servers of the delegate set |
<!-- END_TF_DOCS -->
