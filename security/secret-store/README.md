# security/secret-store

Creates an SSM Parameter Store secret (SecureString type) and ignores subsequent value changes, preserving any manual or automated updates made outside of Terraform.

## Overview

The `lifecycle { ignore_changes = [value] }` block means that once a secret is created with its initial value, Terraform will never overwrite it on subsequent applies. This is intentional: secrets are typically rotated or updated by applications or operators after initial provisioning. To force a value update, the resource must be tainted or the parameter must be deleted and recreated.

## Usage

```hcl
module "db_password" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//security/secret-store?ref=v1.0.0"

  name          = "/my-app/db/password"
  description   = "RDS master password"
  initial_value = "change-me-on-first-use"
  common_tags   = local.common_tags
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
| [aws_ssm_parameter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_description"></a> [description](#input\_description) | A description for the value to be stored | `string` | `""` | no |
| <a name="input_key"></a> [key](#input\_key) | Key to store the secret value under | `string` | n/a | yes |
| <a name="input_required"></a> [required](#input\_required) | Do we need to store this secret | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for the secret parameter | `map(string)` | `{}` | no |
| <a name="input_type"></a> [type](#input\_type) | What is the type of value to be stored | `string` | `"String"` | no |
| <a name="input_value"></a> [value](#input\_value) | What is the value to be stored | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
