# database/cluster-param-group

Creates an Aurora RDS cluster parameter group with character set and collation settings, and forces UTC as the cluster time zone.

## Overview

All character set parameters default to `utf8` / `utf8_general_ci` for broad compatibility. The time zone is hardcoded to UTC to ensure consistent timestamp storage regardless of the region where the cluster is deployed.

The `db_family` defaults to `aurora-mysql8.0`. Callers running Aurora MySQL 5.7 must explicitly pass `db_family = "aurora-mysql5.7"`, and callers using the Aurora Serverless (v1) engine should pass `db_family = "aurora5.6"`.

## Usage

```hcl
module "cluster_params" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//database/cluster-param-group?ref=v1.0.0"

  name        = "my-app-cluster"
  db_family   = "aurora-mysql5.7"
  common_tags = local.common_tags
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
