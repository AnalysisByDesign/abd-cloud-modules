# security/security-group-rule-cidr

Creates a single security group ingress or egress rule allowing traffic from a CIDR block on a specified port range and protocol.

## Usage

```hcl
module "allow_https_from_internet" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//security/security-group-rule-cidr?ref=v1.0.0"

  security_group_id = module.alb_sg.id
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.100.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_security_group_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_cidr_blocks"></a> [cidr\_blocks](#input\_cidr\_blocks) | List of CIDR blocks | `list(string)` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | The description for the security group | `string` | `""` | no |
| <a name="input_from_port"></a> [from\_port](#input\_from\_port) | The security group port range start | `string` | `""` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | The security group protocol | `string` | n/a | yes |
| <a name="input_required"></a> [required](#input\_required) | Do we want to build this security group rule | `bool` | `true` | no |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | The security group id to attach this rule to | `string` | n/a | yes |
| <a name="input_self"></a> [self](#input\_self) | Use the security group as an ingress source | `bool` | `false` | no |
| <a name="input_single_port"></a> [single\_port](#input\_single\_port) | The security group single port | `string` | `""` | no |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | Configurable timeouts for the resource | `map(string)` | `{}` | no |
| <a name="input_to_port"></a> [to\_port](#input\_to\_port) | The security group port range end | `string` | `""` | no |
| <a name="input_type"></a> [type](#input\_type) | The security group type - egress or ingress | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_description"></a> [description](#output\_description) | Description of the security group |
| <a name="output_id"></a> [id](#output\_id) | Id of the security group |
<!-- END_TF_DOCS -->
