# compute/asg

Creates an EC2 Auto Scaling Group that references an existing launch template by ID.

## Overview

The ASG is configured with minimum, maximum, and desired instance counts. It uses a launch template reference (`$Latest` version) and supports attaching to load balancer target groups. Instance tags are propagated to launched instances via the `tags` block. Health checks default to `EC2` type but can be switched to `ELB` for load-balanced workloads.

This module is intended to be used alongside `compute/launch-template` — the launch template is created separately and its ID is passed to this module.

## Usage

```hcl
module "app_asg" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//compute/asg?ref=v1.0.0"

  name               = "my-app"
  min_size           = 1
  max_size           = 4
  desired_capacity   = 2
  launch_template_id = module.launch_template.id
  subnet_ids         = module.vpc.private_subnet_ids
  target_group_arns  = [module.alb.target_group_arn]
  common_tags        = local.common_tags
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
