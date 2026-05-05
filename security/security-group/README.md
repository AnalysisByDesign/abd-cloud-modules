# security/security-group

Creates an EC2 security group with no inline rules. All rules are managed separately using `security/security-group-rule-cidr` or `security/security-group-rule-link`, following the split-rule pattern that prevents Terraform cycle errors in complex rule graphs.

## Usage

```hcl
module "app_sg" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//security/security-group?ref=v1.0.0"

  name        = "my-app"
  description = "Application tier security group"
  vpc_id      = module.vpc.vpc_id
  common_tags = local.common_tags
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
