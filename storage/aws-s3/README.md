# storage/aws-s3

Creates an S3 bucket with full AWS provider 5.x compatibility: encryption, versioning, ACL, logging, lifecycle rules, replication, and transfer acceleration are each managed as separate resources rather than inline properties.

## Overview

The module always creates a KMS key for server-side encryption. All other features (versioning, ACL, logging, lifecycle, replication, acceleration, bucket policy) are conditionally created based on the corresponding input variables. A `aws_s3_bucket_public_access_block` resource is always created, and `aws_s3_bucket_ownership_controls` is set to `ObjectWriter` when a non-private ACL is requested, and `BucketOwnerEnforced` otherwise.

Setting `create_bucket = false` suppresses all resource creation while still returning empty string outputs, allowing callers to conditionally include the module without `count` at the call site.

## Usage

```hcl
module "my_bucket" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//storage/aws-s3?ref=v1.0.0"

  name        = "my-application-bucket"
  common_tags = local.common_tags
}
```

With optional features:

```hcl
module "my_bucket" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//storage/aws-s3?ref=v1.0.0"

  name              = "my-application-bucket"
  enable_versioning = true
  logging = {
    target_bucket = module.access_log_bucket.id
    target_prefix = "my-application-bucket/"
  }
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
| [aws_kms_key.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_acceleration_status"></a> [acceleration\_status](#input\_acceleration\_status) | Acceleration status of the bucket | `string` | `"Suspended"` | no |
| <a name="input_acl"></a> [acl](#input\_acl) | The canned ACL to apply | `string` | `"private"` | no |
| <a name="input_bucket_policy"></a> [bucket\_policy](#input\_bucket\_policy) | S3 bucket policy | `string` | `""` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_count"></a> [count](#input\_count) | Do we need to create the bucket | `string` | `"1"` | no |
| <a name="input_enable_mfa_delete"></a> [enable\_mfa\_delete](#input\_enable\_mfa\_delete) | Require an MFA device to delete objects | `bool` | `false` | no |
| <a name="input_enable_versioning"></a> [enable\_versioning](#input\_enable\_versioning) | Enable object versioning | `bool` | `false` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Forcibly destroy all objects if removing the bucket - be careful! | `bool` | `false` | no |
| <a name="input_lifecycle_rule"></a> [lifecycle\_rule](#input\_lifecycle\_rule) | Lifecycle rules for the bucket | `list(string)` | `[]` | no |
| <a name="input_logging"></a> [logging](#input\_logging) | Logging definition for the bucket | `list(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the S3 bucket | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | A different region to build the bucket in | `string` | `""` | no |
| <a name="input_replication_configuration"></a> [replication\_configuration](#input\_replication\_configuration) | Replication configuration details | `list(string)` | `[]` | no |
| <a name="input_s3_tags"></a> [s3\_tags](#input\_s3\_tags) | Additional tags for the S3 bucket | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the S3 bucket |
| <a name="output_bucket_domain_name"></a> [bucket\_domain\_name](#output\_bucket\_domain\_name) | The domain name of the S3 bucket |
| <a name="output_bucket_regional_domain_name"></a> [bucket\_regional\_domain\_name](#output\_bucket\_regional\_domain\_name) | The regional domain name of the S3 bucket |
| <a name="output_hosted_zone_id"></a> [hosted\_zone\_id](#output\_hosted\_zone\_id) | The R53 hosted zone id of the S3 bucket |
| <a name="output_id"></a> [id](#output\_id) | The ID of the S3 bucket |
<!-- END_TF_DOCS -->
