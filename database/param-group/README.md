# database/param-group

Creates an RDS DB instance parameter group with pre-tuned settings for Aurora MySQL workloads: query cache configuration, slow query logging, connection limits, and character encoding.

## Overview

Default parameter values are tuned for typical WordPress/PHP workloads (query cache enabled, slow query threshold 2 seconds, max 1500 connections). The `db_family` defaults to `aurora-mysql8.0` — callers running Aurora MySQL 5.7 must explicitly pass `db_family = "aurora-mysql5.7"` to avoid a recreate on plan.

## Usage

```hcl
module "db_params" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//database/param-group?ref=v1.0.0"

  name        = "my-app-db"
  db_family   = "aurora-mysql5.7"
  common_tags = local.common_tags
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
