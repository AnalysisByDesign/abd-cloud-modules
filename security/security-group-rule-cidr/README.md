# security/security-group-rule-cidr

Creates a single security group ingress or egress rule allowing traffic from a CIDR block on a specified port range and protocol.

## Usage

```hcl
module "allow_https_from_internet" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//security/security-group-rule-cidr?ref=v1.0.0"

  security_group_id = module.alb_sg.id
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
