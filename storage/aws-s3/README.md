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

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.100.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_kms_key.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_accelerate_configuration.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_accelerate_configuration) | resource |
| [aws_s3_bucket_acl.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_lifecycle_configuration.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_logging.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_ownership_controls.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_policy.bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_replication_configuration.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_replication_configuration) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_acceleration_status"></a> [acceleration\_status](#input\_acceleration\_status) | Transfer acceleration status. Set to 'Enabled' to enable, or leave empty to leave unconfigured. | `string` | `""` | no |
| <a name="input_acl"></a> [acl](#input\_acl) | Canned ACL to apply. If empty or 'private', BucketOwnerEnforced ownership is used (no ACL). Any other value enables ObjectWriter ownership. | `string` | `"private"` | no |
| <a name="input_bucket_policy"></a> [bucket\_policy](#input\_bucket\_policy) | S3 bucket policy JSON document | `string` | `""` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_create_bucket"></a> [create\_bucket](#input\_create\_bucket) | Set to false to skip creating the bucket (replaces the old 'count' variable) | `bool` | `true` | no |
| <a name="input_enable_mfa_delete"></a> [enable\_mfa\_delete](#input\_enable\_mfa\_delete) | Require an MFA device to delete versioned objects | `bool` | `false` | no |
| <a name="input_enable_versioning"></a> [enable\_versioning](#input\_enable\_versioning) | Enable S3 object versioning | `bool` | `false` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Forcibly destroy all objects when removing the bucket | `bool` | `false` | no |
| <a name="input_lifecycle_rule"></a> [lifecycle\_rule](#input\_lifecycle\_rule) | List of lifecycle rule objects. Each object requires: id, enabled. Optional: expiration, noncurrent\_version\_expiration, transition. | `list(any)` | `[]` | no |
| <a name="input_logging"></a> [logging](#input\_logging) | Access logging configuration. Set to null to disable logging. | <pre>object({<br/>    target_bucket = string<br/>    target_prefix = string<br/>  })</pre> | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the S3 bucket | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Deprecated: bucket region is now controlled by the provider configuration | `string` | `""` | no |
| <a name="input_replication_configuration"></a> [replication\_configuration](#input\_replication\_configuration) | Replication configuration object with 'role' and 'rules' keys. Set to null to disable. | `any` | `null` | no |
| <a name="input_s3_tags"></a> [s3\_tags](#input\_s3\_tags) | Additional tags for the S3 bucket | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the S3 bucket |
| <a name="output_bucket_domain_name"></a> [bucket\_domain\_name](#output\_bucket\_domain\_name) | The domain name of the S3 bucket |
| <a name="output_bucket_regional_domain_name"></a> [bucket\_regional\_domain\_name](#output\_bucket\_regional\_domain\_name) | The regional domain name of the S3 bucket |
| <a name="output_hosted_zone_id"></a> [hosted\_zone\_id](#output\_hosted\_zone\_id) | The Route53 hosted zone ID of the S3 bucket |
| <a name="output_id"></a> [id](#output\_id) | The ID of the S3 bucket |
<!-- END_TF_DOCS -->
