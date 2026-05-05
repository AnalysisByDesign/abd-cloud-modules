# cache/cluster-param-group

Creates an ElastiCache parameter group for Redis clusters, enabling `activerehashing` by default.

## Overview

The `elasticache_family` defaults to `redis7.x`. Callers using an older Redis version must pass the appropriate family (e.g. `redis4.0`, `redis6.x`) explicitly to avoid a parameter group recreate on plan.

## Usage

```hcl
module "redis_params" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//cache/cluster-param-group?ref=v1.0.0"

  name               = "my-redis-cluster"
  elasticache_family = "redis4.0"
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
| [aws_elasticache_parameter_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_parameter_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_activerehashing"></a> [activerehashing](#input\_activerehashing) | n/a | `string` | `"yes"` | no |
| <a name="input_count"></a> [count](#input\_count) | Count of number of resources required | `number` | `1` | no |
| <a name="input_description"></a> [description](#input\_description) | The IAM policy description | `string` | `"Terraform managed"` | no |
| <a name="input_elasticache_family"></a> [elasticache\_family](#input\_elasticache\_family) | n/a | `string` | `"redis4.0"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of Elasticache cluster parameter groups | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_id"></a> [id](#output\_id) | The id of the Elasticache cluster parameter group |
| <a name="output_name"></a> [name](#output\_name) | The name of the Elasticache cluster parameter group |
<!-- END_TF_DOCS -->
