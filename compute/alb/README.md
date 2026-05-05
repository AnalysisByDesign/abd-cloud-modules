# compute/alb

Creates an Application Load Balancer with an HTTPS listener (port 443), an HTTP→HTTPS redirect listener (port 80), a target group with configurable health checks, and an optional WAFv2 web ACL association.

## Overview

The ALB is configured as internet-facing by default (`internal = false`). The HTTPS listener forwards to the target group; the HTTP listener issues a 301 redirect to HTTPS. Target group health check parameters are fully configurable including path, interval, timeout, and success codes.

The SSL policy defaults to `ELBSecurityPolicy-TLS13-1-2-2021-06`, which enforces TLS 1.3/1.2 and drops legacy cipher suites. Override `ssl_policy` explicitly if a different policy is required for compatibility.

WAFv2 association is opt-in via `waf_enabled = true` with a corresponding `waf_web_acl_arn`.

## Usage

```hcl
module "app_alb" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//compute/alb?ref=v1.0.0"

  name               = "my-app"
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.vpc.public_subnet_ids
  security_group_ids = [module.alb_sg.id]
  acm_arn            = module.ssl_cert.cert_validation_arn
  common_tags        = local.common_tags
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
