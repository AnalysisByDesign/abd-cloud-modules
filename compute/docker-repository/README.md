# compute/docker-repository

Creates an ECR (Elastic Container Registry) repository with an optional access policy and lifecycle policy for automated image cleanup.

## Overview

Creates one repository, gated on `required`. Tag mutability (with optional wildcard exclusion filters), basic scan on push, encryption and tags are configurable, and each defaults to the AWS defaults (mutable, no scan on push, `AES256`, no tags). The access policy and lifecycle policy are created only when their documents are supplied: same-account IAM access needs no repository policy.

## Usage

```hcl
module "ecr" {
  source = "../../../../abd-cloud-modules/compute/docker-repository"

  required        = true
  repository_name = "abd/base"
  scan_on_push    = true
  tags            = local.common_tags

  repository_lifecycle_document = file("${path.module}/files/ecr-lifecycle.json")
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
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.72.0 |

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
| <a name="input_encryption_type"></a> [encryption\_type](#input\_encryption\_type) | Encryption at rest: AES256 (free) or KMS (set kms\_key\_arn, or leave empty for the AWS managed key) | `string` | `"AES256"` | no |
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | Tag mutability: MUTABLE, IMMUTABLE, MUTABLE\_WITH\_EXCLUSION or IMMUTABLE\_WITH\_EXCLUSION | `string` | `"MUTABLE"` | no |
| <a name="input_image_tag_mutability_exclusion_filters"></a> [image\_tag\_mutability\_exclusion\_filters](#input\_image\_tag\_mutability\_exclusion\_filters) | Wildcard tag filters that take the opposite mutability (only with the *\_WITH\_EXCLUSION settings) | `list(string)` | `[]` | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | KMS key ARN when encryption\_type is KMS (empty for the AWS managed key) | `string` | `""` | no |
| <a name="input_repository_lifecycle_document"></a> [repository\_lifecycle\_document](#input\_repository\_lifecycle\_document) | Lifecycle policies for ECR | `string` | `""` | no |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | Name of docker repository | `string` | n/a | yes |
| <a name="input_repository_policy_document"></a> [repository\_policy\_document](#input\_repository\_policy\_document) | Policies for ECR repository | `string` | `""` | no |
| <a name="input_required"></a> [required](#input\_required) | Do we need to build repository | `bool` | `false` | no |
| <a name="input_scan_on_push"></a> [scan\_on\_push](#input\_scan\_on\_push) | Run a basic vulnerability scan when an image is pushed | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the repository | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_registry_id"></a> [registry\_id](#output\_registry\_id) | n/a |
| <a name="output_repository_arn"></a> [repository\_arn](#output\_repository\_arn) | n/a |
| <a name="output_repository_name"></a> [repository\_name](#output\_repository\_name) | n/a |
| <a name="output_repository_url"></a> [repository\_url](#output\_repository\_url) | n/a |
<!-- END_TF_DOCS -->
