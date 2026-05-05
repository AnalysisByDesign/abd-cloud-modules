# security/iam-policy

Creates an IAM policy from a rendered policy document string.

## Usage

```hcl
module "app_policy" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//security/iam-policy?ref=v1.0.0"

  name        = "my-app-policy"
  description = "Allows the application to read from S3 and write to SQS"
  policy      = data.aws_iam_policy_document.app.json
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
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_create_me"></a> [create\_me](#input\_create\_me) | Should we create the policy | `number` | `1` | no |
| <a name="input_description"></a> [description](#input\_description) | The IAM policy description | `string` | `"Terraform managed"` | no |
| <a name="input_name"></a> [name](#input\_name) | The IAM policy name | `string` | n/a | yes |
| <a name="input_path"></a> [path](#input\_path) | Path location for policy to be created | `string` | `"/"` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | The IAM policy to apply | `string` | `""` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the policy |
| <a name="output_name"></a> [name](#output\_name) | Name of the policy |
<!-- END_TF_DOCS -->
