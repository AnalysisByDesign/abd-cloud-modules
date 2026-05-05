# security/security-group

Creates an EC2 security group with no inline rules. All rules are managed separately using `security/security-group-rule-cidr` or `security/security-group-rule-link`, following the split-rule pattern that prevents Terraform cycle errors in complex rule graphs.

## Usage

```hcl
module "app_sg" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//security/security-group?ref=v1.0.0"

  name        = "my-app"
  description = "Application tier security group"
  vpc_id      = module.vpc.vpc_id
  common_tags = local.common_tags
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
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | The description for the security group | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | The security group name | `string` | n/a | yes |
| <a name="input_revoke_rules_on_delete"></a> [revoke\_rules\_on\_delete](#input\_revoke\_rules\_on\_delete) | Should we force delete all rules before deleting the SG | `bool` | `false` | no |
| <a name="input_sg_tags"></a> [sg\_tags](#input\_sg\_tags) | Additional tags for the security group | `map(string)` | `{}` | no |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | Configurable timeouts for the resource | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC id to build the security group in | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the security group |
| <a name="output_id"></a> [id](#output\_id) | Id of the security group |
| <a name="output_name"></a> [name](#output\_name) | Name of the security group |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC\_id of the security group |
<!-- END_TF_DOCS -->
