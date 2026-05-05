# database/dynamodb

Creates a DynamoDB table pre-configured for use as a Terraform state locking backend. The table uses `LockID` as the hash key with 20 read/write capacity units.

## Overview

This module exists specifically to bootstrap the `terraform-state-lock` table used by all subsequent Terraform operations. It is provisioned once in the management account (`abd-global`) using local credentials before any other infrastructure is built. The capacity units are fixed at 20 RCU/WCU, which is sufficient for small-to-medium teams with concurrent Terraform runs.

## Usage

```hcl
module "tf_state_lock" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//database/dynamodb?ref=v1.0.0"

  name        = "terraform-state-lock"
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
| [aws_dynamodb_table.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_dynamodb_tags"></a> [dynamodb\_tags](#input\_dynamodb\_tags) | Additional tags for the DynamoDB table | `map(string)` | <pre>{<br/>  "Component": "dynamodb"<br/>}</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the DynamoDB table | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
