# compute/ecs/task

Registers an ECS task definition specifying the container image, CPU and memory allocation, IAM execution role, task role, and log configuration.

## Overview

The task definition JSON (container definitions) is passed as a rendered string, typically produced via `templatefile()` from a `.json.tpl` file. Supports both `awsvpc` (required for Fargate) and `bridge` network modes. The `execution_role_arn` grants ECS permission to pull the image and write logs; the `task_role_arn` grants the running container access to other AWS services.

## Usage

```hcl
module "app_task" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//compute/ecs/task?ref=v1.0.0"

  name                  = "my-app"
  container_definitions = templatefile("./files/task.json.tpl", { image = var.docker_image })
  cpu                   = 512
  memory                = 1024
  execution_role_arn    = module.ecs_execution_role.arn
  task_role_arn         = module.app_role.arn
  common_tags           = local.common_tags
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
| [aws_ecs_task_definition.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_container_definitions"></a> [container\_definitions](#input\_container\_definitions) | A list of valid container definitions provided as a single valid JSON document. | `string` | n/a | yes |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | CPU units to allocate to the tasks | `string` | `"256"` | no |
| <a name="input_family"></a> [family](#input\_family) | A unique name for your task definition. | `string` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | RAM to allocate to the tasks | `string` | `"512"` | no |
| <a name="input_network_mode"></a> [network\_mode](#input\_network\_mode) | The Docker networking mode - none, bridge, awsvpc or host. | `string` | `""` | no |
| <a name="input_requires_compatibilities"></a> [requires\_compatibilities](#input\_requires\_compatibilities) | A set of launch types required by the task. The valid values are EC2 and FARGATE | `string` | `""` | no |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | Role ECS ARN | `string` | `""` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_defininition_id"></a> [defininition\_id](#output\_defininition\_id) | n/a |
| <a name="output_definition_arn"></a> [definition\_arn](#output\_definition\_arn) | n/a |
| <a name="output_definition_revision"></a> [definition\_revision](#output\_definition\_revision) | n/a |
| <a name="output_family"></a> [family](#output\_family) | n/a |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | n/a |
<!-- END_TF_DOCS -->
