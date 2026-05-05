# compute/elb

Creates a Classic Elastic Load Balancer (ELB) with configurable listeners, health checks, and cross-zone load balancing.

> **Note:** Classic ELB is a legacy resource. New workloads should use `compute/alb` (Application Load Balancer) or `compute/nlb` (Network Load Balancer). This module is retained for backwards compatibility with existing infrastructure.

## Usage

```hcl
module "legacy_lb" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//compute/elb?ref=v1.0.0"

  name               = "my-app"
  subnet_ids         = module.vpc.public_subnet_ids
  security_group_ids = [module.lb_sg.id]
  common_tags        = local.common_tags
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
