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
<!-- END_TF_DOCS -->
