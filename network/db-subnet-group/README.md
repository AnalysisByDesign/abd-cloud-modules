# network/db-subnet-group

Creates an RDS DB subnet group spanning the supplied subnets for multi-AZ database deployments.

## Usage

```hcl
module "db_subnet_group" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//network/db-subnet-group?ref=v1.0.0"

  name        = "my-app"
  subnet_ids  = module.vpc.database_subnet_ids
  common_tags = local.common_tags
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
