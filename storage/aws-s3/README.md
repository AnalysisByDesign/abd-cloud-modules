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
<!-- END_TF_DOCS -->
