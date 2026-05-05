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
<!-- END_TF_DOCS -->
