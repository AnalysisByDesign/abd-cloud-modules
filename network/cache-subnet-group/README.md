# network/cache-subnet-group

Creates an ElastiCache subnet group associating the specified subnets with Redis or Memcached clusters.

## Usage

```hcl
module "cache_subnet_group" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//network/cache-subnet-group?ref=v1.0.0"

  name        = "my-app"
  subnet_ids  = module.vpc.cache_subnet_ids
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
| [aws_elasticache_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_count"></a> [count](#input\_count) | Count of number of resources required | `number` | `1` | no |
| <a name="input_description"></a> [description](#input\_description) | The IAM policy description | `string` | `"Terraform managed"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of Cache subnet group table | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The VPC subnet ids to group together | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_id"></a> [id](#output\_id) | The id of the Cache subnet group |
| <a name="output_name"></a> [name](#output\_name) | The name of the Cache parameter group |
<!-- END_TF_DOCS -->
