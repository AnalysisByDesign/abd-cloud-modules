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
## Requirements

No requirements.

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_ecs_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_ecs_insights"></a> [ecs\_insights](#input\_ecs\_insights) | Enable or disable Container Insights | `string` | `"disabled"` | no |
| <a name="input_ecs_tags"></a> [ecs\_tags](#input\_ecs\_tags) | Additional tags for the cluster | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the cluster | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | n/a |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | n/a |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | n/a |
<!-- END_TF_DOCS -->
