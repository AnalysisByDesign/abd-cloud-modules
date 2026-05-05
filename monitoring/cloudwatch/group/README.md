# monitoring/cloudwatch/group

Creates one or more CloudWatch log groups for centralised application and infrastructure logging.

## Overview

Log groups are created from the `log_group_names` list, allowing multiple groups to be provisioned in a single module call. Each group has a configurable retention period (default 90 days). Groups are typically shared between the application tier, web servers, and infrastructure components.

## Usage

```hcl
module "log_groups" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//monitoring/cloudwatch/group?ref=v1.0.0"

  log_group_names    = ["infra", "web", "app"]
  retention_in_days  = 90
  common_tags        = local.common_tags
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
| [aws_cloudwatch_log_group.log_groups](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_cloudwatch_loggroup_names"></a> [cloudwatch\_loggroup\_names](#input\_cloudwatch\_loggroup\_names) | Group name for cloudwatch | `list(string)` | n/a | yes |
| <a name="input_cloudwatch_tags"></a> [cloudwatch\_tags](#input\_cloudwatch\_tags) | Additional tags for CloudWatch | `map(string)` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_groups_arn"></a> [groups\_arn](#output\_groups\_arn) | List of the ARNs of the log groups created |
| <a name="output_names_of_groups"></a> [names\_of\_groups](#output\_names\_of\_groups) | List of the names of the log groups created |
<!-- END_TF_DOCS -->
