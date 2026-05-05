# cache/cluster-param-group

Creates an ElastiCache parameter group for Redis clusters, enabling `activerehashing` by default.

## Overview

The `elasticache_family` defaults to `redis7.x`. Callers using an older Redis version must pass the appropriate family (e.g. `redis4.0`, `redis6.x`) explicitly to avoid a parameter group recreate on plan.

## Usage

```hcl
module "redis_params" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//cache/cluster-param-group?ref=v1.0.0"

  name               = "my-redis-cluster"
  elasticache_family = "redis4.0"
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
