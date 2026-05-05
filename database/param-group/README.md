# database/param-group

Creates an RDS DB instance parameter group with pre-tuned settings for Aurora MySQL workloads: query cache configuration, slow query logging, connection limits, and character encoding.

## Overview

Default parameter values are tuned for typical WordPress/PHP workloads (query cache enabled, slow query threshold 2 seconds, max 1500 connections). The `db_family` defaults to `aurora-mysql8.0` — callers running Aurora MySQL 5.7 must explicitly pass `db_family = "aurora-mysql5.7"` to avoid a recreate on plan.

## Usage

```hcl
module "db_params" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//database/param-group?ref=v1.0.0"

  name        = "my-app-db"
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
| [aws_db_parameter_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_count"></a> [count](#input\_count) | Count of number of resources required | `number` | `1` | no |
| <a name="input_db_family"></a> [db\_family](#input\_db\_family) | The Aurora family for the param group | `string` | `"aurora-mysql5.7"` | no |
| <a name="input_description"></a> [description](#input\_description) | The RDS parameter groups description | `string` | `"Terraform managed"` | no |
| <a name="input_group_concat_max_len"></a> [group\_concat\_max\_len](#input\_group\_concat\_max\_len) | Group concat max string length (default 4 Gb) | `number` | `4294967295` | no |
| <a name="input_log_bin_trust_function_creators"></a> [log\_bin\_trust\_function\_creators](#input\_log\_bin\_trust\_function\_creators) | Allow creation of stored procedures | `number` | `1` | no |
| <a name="input_log_error_verbosity"></a> [log\_error\_verbosity](#input\_log\_error\_verbosity) | What level of warnings to log to the error file (default error and warning) | `number` | `2` | no |
| <a name="input_log_warnings"></a> [log\_warnings](#input\_log\_warnings) | What level of warnings to log to the error file (default error and warning) | `number` | `2` | no |
| <a name="input_long_query_time"></a> [long\_query\_time](#input\_long\_query\_time) | Long query time in seconds | `number` | `2` | no |
| <a name="input_max_allowed_packet"></a> [max\_allowed\_packet](#input\_max\_allowed\_packet) | Max allowed input data packet (default 1 Gb) | `number` | `1073741824` | no |
| <a name="input_max_connections"></a> [max\_connections](#input\_max\_connections) | Max inbound connections allowed | `number` | `1500` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of DB parameter groups | `string` | n/a | yes |
| <a name="input_param_group_tags"></a> [param\_group\_tags](#input\_param\_group\_tags) | A map of tags to add to parameter group | `map(string)` | <pre>{<br/>  "Component": "rds aurora"<br/>}</pre> | no |
| <a name="input_query_cache_limit"></a> [query\_cache\_limit](#input\_query\_cache\_limit) | Do not cache results larger than ... (default 1 Mb) | `number` | `1048576` | no |
| <a name="input_query_cache_min_res_unit"></a> [query\_cache\_min\_res\_unit](#input\_query\_cache\_min\_res\_unit) | Do not cache results smaller than ... (default 4 Kb) | `number` | `4096` | no |
| <a name="input_query_cache_size"></a> [query\_cache\_size](#input\_query\_cache\_size) | Size of query cache in bytes (default 8 Mb) | `number` | `8388608` | no |
| <a name="input_query_cache_type"></a> [query\_cache\_type](#input\_query\_cache\_type) | Enable or disable the query cache (Recommended ON for Aurora) | `number` | `1` | no |
| <a name="input_slow_query_log"></a> [slow\_query\_log](#input\_slow\_query\_log) | Enable the slow query log | `number` | `1` | no |
| <a name="input_sql_mode"></a> [sql\_mode](#input\_sql\_mode) | Current SQL Server Mode. | `string` | `"NO_ENGINE_SUBSTITUTION"` | no |
| <a name="input_wait_timeout"></a> [wait\_timeout](#input\_wait\_timeout) | The number of seconds the server waits for activity on a non-interactive connection | `number` | `600` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the DB parameter group |
| <a name="output_id"></a> [id](#output\_id) | The id of the DB parameter group |
| <a name="output_name"></a> [name](#output\_name) | The name of the DB parameter group |
<!-- END_TF_DOCS -->
