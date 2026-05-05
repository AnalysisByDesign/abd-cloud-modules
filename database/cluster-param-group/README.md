# database/cluster-param-group

Creates an Aurora RDS cluster parameter group with character set and collation settings, and forces UTC as the cluster time zone.

## Overview

All character set parameters default to `utf8` / `utf8_general_ci` for broad compatibility. The time zone is hardcoded to UTC to ensure consistent timestamp storage regardless of the region where the cluster is deployed.

The `db_family` defaults to `aurora-mysql8.0`. Callers running Aurora MySQL 5.7 must explicitly pass `db_family = "aurora-mysql5.7"`, and callers using the Aurora Serverless (v1) engine should pass `db_family = "aurora5.6"`.

## Usage

```hcl
module "cluster_params" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//database/cluster-param-group?ref=v1.0.0"

  name        = "my-app-cluster"
  db_family   = "aurora-mysql5.7"
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
| [aws_rds_cluster_parameter_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_parameter_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_character_set"></a> [character\_set](#input\_character\_set) | Default character set configuration | `string` | `"utf8"` | no |
| <a name="input_collation"></a> [collation](#input\_collation) | Default collation configuration | `string` | `"utf8_general_ci"` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_count"></a> [count](#input\_count) | Count of number of resources required | `number` | `1` | no |
| <a name="input_db_family"></a> [db\_family](#input\_db\_family) | The Aurora family for the param group | `string` | `"aurora-mysql5.7"` | no |
| <a name="input_description"></a> [description](#input\_description) | The RDS parameter groups description | `string` | `"Terraform managed"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of DB cluster parameter groups | `string` | n/a | yes |
| <a name="input_param_group_tags"></a> [param\_group\_tags](#input\_param\_group\_tags) | A map of tags to add to cluster parameter group | `map(string)` | <pre>{<br/>  "Component": "rds aurora"<br/>}</pre> | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the DB cluster parameter group |
| <a name="output_id"></a> [id](#output\_id) | The id of the DB cluster parameter group |
| <a name="output_name"></a> [name](#output\_name) | The name of the DB cluster parameter group |
<!-- END_TF_DOCS -->
