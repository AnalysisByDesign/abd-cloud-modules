# security/security-group-rule-link

Creates a single security group ingress or egress rule allowing traffic from a source security group on a specified port range and protocol.

## Overview

Use this module instead of `security/security-group-rule-cidr` when the traffic source is another security group rather than a CIDR range. The linked security group can be in the same VPC or a peered VPC (if peering allows it).

## Usage

```hcl
module "allow_alb_to_app" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//security/security-group-rule-link?ref=v1.0.0"

  security_group_id        = module.app_sg.id
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = module.alb_sg.id
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
