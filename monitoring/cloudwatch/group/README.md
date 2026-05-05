# monitoring/cloudwatch/group

Creates one or more CloudWatch log groups for centralised application and infrastructure logging.

## Overview

Log groups are created from the `log_group_names` list, allowing multiple groups to be provisioned in a single module call. Each group has a configurable retention period (default 90 days). Groups are typically shared between the application tier, web servers, and infrastructure components.

## Usage

```hcl
module "log_groups" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//monitoring/cloudwatch/group?ref=v1.0.0"

  log_group_names    = ["infra", "web", "app"]
  retention_in_days  = 90
  common_tags        = local.common_tags
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
