# monitoring/cloudwatch/group

Creates one or more CloudWatch log groups for centralised application and infrastructure logging.

## Overview

Log groups are created from the `cloudwatch_loggroup_names` list, allowing multiple groups to be provisioned in a single module call. Each group keeps events for `retention_in_days` (default 7).

## Usage

```hcl
module "log_groups" {
  source = "../../../abd-cloud-modules/monitoring/cloudwatch/group"

  cloudwatch_loggroup_names = ["infra", "web", "app"]
  retention_in_days         = 14
  common_tags               = local.common_tags
  cloudwatch_tags           = {}
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.15.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.73.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_cloudwatch_log_group.log_groups](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_cloudwatch_loggroup_names"></a> [cloudwatch\_loggroup\_names](#input\_cloudwatch\_loggroup\_names) | Group name for cloudwatch | `list(string)` | n/a | yes |
| <a name="input_cloudwatch_tags"></a> [cloudwatch\_tags](#input\_cloudwatch\_tags) | Additional tags for CloudWatch | `map(string)` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | Days to keep log events (0 keeps them forever) | `number` | `7` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_groups_arn"></a> [groups\_arn](#output\_groups\_arn) | List of the ARNs of the log groups created |
| <a name="output_names_of_groups"></a> [names\_of\_groups](#output\_names\_of\_groups) | List of the names of the log groups created |
<!-- END_TF_DOCS -->
