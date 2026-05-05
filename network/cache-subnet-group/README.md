# network/cache-subnet-group

Creates an ElastiCache subnet group associating the specified subnets with Redis or Memcached clusters.

## Usage

```hcl
module "cache_subnet_group" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//network/cache-subnet-group?ref=v1.0.0"

  name        = "my-app"
  subnet_ids  = module.vpc.cache_subnet_ids
  common_tags = local.common_tags
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
