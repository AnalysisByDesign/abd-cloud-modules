# security/security-group-rule-link

Creates a single security group ingress or egress rule allowing traffic from a source security group on a specified port range and protocol.

## Overview

Use this module instead of `security/security-group-rule-cidr` when the traffic source is another security group rather than a CIDR range. The linked security group can be in the same VPC or a peered VPC (if peering allows it).

## Usage

```hcl
module "allow_alb_to_app" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//security/security-group-rule-link?ref=v1.0.0"

  security_group_id        = module.app_sg.id
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = module.alb_sg.id
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
| [aws_security_group_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_description"></a> [description](#input\_description) | The description for the security group | `string` | `""` | no |
| <a name="input_from_port"></a> [from\_port](#input\_from\_port) | The security group port range start | `string` | `""` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | The security group protocol | `string` | n/a | yes |
| <a name="input_required"></a> [required](#input\_required) | Do we want to build this security group rule | `bool` | `true` | no |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | The security group id to attach this rule to | `string` | n/a | yes |
| <a name="input_single_port"></a> [single\_port](#input\_single\_port) | The security group single port | `string` | `""` | no |
| <a name="input_source_security_group_id"></a> [source\_security\_group\_id](#input\_source\_security\_group\_id) | The source security group to allow ingress/egress from/to | `string` | n/a | yes |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | Configurable timeouts for the resource | `map(string)` | `{}` | no |
| <a name="input_to_port"></a> [to\_port](#input\_to\_port) | The security group port range end | `string` | `""` | no |
| <a name="input_type"></a> [type](#input\_type) | The security group type - egress or ingress | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_description"></a> [description](#output\_description) | Description of the security group |
| <a name="output_id"></a> [id](#output\_id) | Id of the security group |
<!-- END_TF_DOCS -->
