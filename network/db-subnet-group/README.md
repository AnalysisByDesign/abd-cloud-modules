# network/db-subnet-group

Creates an RDS DB subnet group spanning the supplied subnets for multi-AZ database deployments.

## Usage

```hcl
module "db_subnet_group" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//network/db-subnet-group?ref=v1.0.0"

  name        = "my-app"
  subnet_ids  = module.vpc.database_subnet_ids
  common_tags = local.common_tags
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
| [aws_db_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | The IAM policy description | `string` | `"Terraform managed"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of DB subnet group table | `string` | n/a | yes |
| <a name="input_required"></a> [required](#input\_required) | Do we need to create this subnet group | `bool` | `true` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The VPC subnet ids to group together | `list(string)` | n/a | yes |
| <a name="input_subnet_tags"></a> [subnet\_tags](#input\_subnet\_tags) | A map of subnet tags to add to subnet group | `map(string)` | <pre>{<br/>  "Component": "rds aurora"<br/>}</pre> | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the DB subnet group |
| <a name="output_id"></a> [id](#output\_id) | The id of the DB subnet group |
| <a name="output_name"></a> [name](#output\_name) | The name of the DB parameter group |
<!-- END_TF_DOCS -->
