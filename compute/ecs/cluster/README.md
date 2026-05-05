# compute/ecs/cluster

Creates an ECS cluster as a logical grouping for container services. Works with both EC2 and Fargate launch types.

## Usage

```hcl
module "app_cluster" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//compute/ecs/cluster?ref=v1.0.0"

  name        = "my-application"
  common_tags = local.common_tags
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
