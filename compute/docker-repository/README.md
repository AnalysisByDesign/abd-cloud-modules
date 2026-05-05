# compute/docker-repository

Creates an ECR (Elastic Container Registry) repository with an optional access policy and lifecycle policy for automated image cleanup.

## Overview

The repository is created with image tag immutability configurable (default mutable). An optional access policy controls which principals can pull or push images — useful for cross-account CI/CD pipelines. The lifecycle policy is passed as a JSON string, allowing arbitrary rules such as expiring untagged images after a set number of days or keeping only the latest N tagged images.

## Usage

```hcl
module "ecr" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//compute/docker-repository?ref=v1.0.0"

  name             = "my-application"
  lifecycle_policy = file("./files/ecr-lifecycle.json")
  common_tags      = local.common_tags
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
| [aws_ecr_lifecycle_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_repository_lifecycle_document"></a> [repository\_lifecycle\_document](#input\_repository\_lifecycle\_document) | Lifecycle policies for ECR | `string` | `""` | no |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | Name of docker repository | `string` | n/a | yes |
| <a name="input_repository_policy_document"></a> [repository\_policy\_document](#input\_repository\_policy\_document) | Policies for ECR repository | `string` | `""` | no |
| <a name="input_required"></a> [required](#input\_required) | Do we need to build repository | `bool` | `false` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_registry_id"></a> [registry\_id](#output\_registry\_id) | n/a |
| <a name="output_repository_arn"></a> [repository\_arn](#output\_repository\_arn) | n/a |
| <a name="output_repository_name"></a> [repository\_name](#output\_repository\_name) | n/a |
| <a name="output_repository_url"></a> [repository\_url](#output\_repository\_url) | n/a |
<!-- END_TF_DOCS -->
