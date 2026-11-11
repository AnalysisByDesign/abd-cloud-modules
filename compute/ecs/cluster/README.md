# compute/ecs/cluster

Creates an ECS cluster, with Container Insights set by `ecs_insights` (default `disabled`).

## Overview

Optionally creates EC2 capacity providers, one per Auto Scaling group, and the cluster's capacity provider association with a default strategy. Managed scaling, managed termination protection and managed draining default to `ENABLED`; managed termination protection needs the ASG's new instances protected from scale in (`protect_from_scale_in` in `compute/asg`). The association is one resource per cluster, so it is only created when `capacity_providers` is not empty, and this module must own every capacity provider the cluster uses.

## Usage

```hcl
module "ecs_cluster" {
  source = "../../../../abd-cloud-modules/compute/ecs/cluster"

  name        = "abd-wordpress-cluster"
  common_tags = local.common_tags

  capacity_providers = {
    "abd-wordpress-ecs-hosts" = {
      auto_scaling_group_arn = data.aws_autoscaling_group.ecs_hosts.arn
    }
  }

  default_capacity_provider_strategy = [
    { capacity_provider = "abd-wordpress-ecs-hosts", base = 1, weight = 1 },
  ]
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.15.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.73.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_ecs_capacity_provider.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_capacity_provider) | resource |
| [aws_ecs_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_cluster_capacity_providers.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster_capacity_providers) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_capacity_providers"></a> [capacity\_providers](#input\_capacity\_providers) | EC2 capacity providers keyed by name (which must not start with aws, ecs or fargate), each backed by an Auto Scaling group | <pre>map(object({<br/>    auto_scaling_group_arn         = string<br/>    managed_termination_protection = optional(string, "ENABLED")<br/>    managed_draining               = optional(string, "ENABLED")<br/>    managed_scaling                = optional(string, "ENABLED")<br/>    target_capacity                = optional(number, 100)<br/>    minimum_scaling_step_size      = optional(number, 1)<br/>    maximum_scaling_step_size      = optional(number, 1)<br/>    instance_warmup_period         = optional(number, 300)<br/>  }))</pre> | `{}` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_default_capacity_provider_strategy"></a> [default\_capacity\_provider\_strategy](#input\_default\_capacity\_provider\_strategy) | The cluster's default capacity provider strategy; each capacity\_provider is a key of capacity\_providers | <pre>list(object({<br/>    capacity_provider = string<br/>    weight            = optional(number, 1)<br/>    base              = optional(number, 0)<br/>  }))</pre> | `[]` | no |
| <a name="input_ecs_insights"></a> [ecs\_insights](#input\_ecs\_insights) | Container Insights: disabled, enabled or enhanced | `string` | `"disabled"` | no |
| <a name="input_ecs_tags"></a> [ecs\_tags](#input\_ecs\_tags) | Additional tags for the cluster | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the cluster | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_capacity_provider_names"></a> [capacity\_provider\_names](#output\_capacity\_provider\_names) | Names of the capacity providers this module created |
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | n/a |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | n/a |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | n/a |
<!-- END_TF_DOCS -->
