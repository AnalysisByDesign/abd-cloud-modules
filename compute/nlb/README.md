# compute/nlb

Creates a Network Load Balancer for TCP-based traffic with a target group, TCP listener, and configurable health checks.

## Overview

NLBs operate at Layer 4 and are suited to workloads requiring static IP addresses, ultra-low latency, or TLS pass-through. Unlike the ALB module, no HTTPS termination is performed — the NLB forwards raw TCP traffic to targets.

## Usage

```hcl
module "app_nlb" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//compute/nlb?ref=v1.0.0"

  name        = "my-app"
  subnet_ids  = module.vpc.public_subnet_ids
  vpc_id      = module.vpc.vpc_id
  common_tags = local.common_tags
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
