# compute/ecs/task

Registers an ECS task definition from a rendered container definitions document.

## Overview

The container definitions are passed as a JSON string, typically from `jsonencode()` or `templatefile()`. `execution_role_arn` lets ECS pull the image, write logs and read secrets; `task_role_arn` is what the running containers use. The original single `role_arn` still works and fills either role left unset. `volumes` supports host paths and EFS, preferably through an access point with IAM authorisation; transit encryption is always on. `cpu_architecture` sets the runtime platform so the task only places on hosts of that architecture. Set `cpu` and `memory` to null to size containers individually (EC2 only).

## Usage

```hcl
module "task" {
  source = "../../../../abd-cloud-modules/compute/ecs/task"

  family                   = "abd-wordpress-hello"
  container_definitions    = jsonencode(local.containers)
  requires_compatibilities = "EC2"
  network_mode             = "bridge"
  cpu                      = null
  memory                   = null
  cpu_architecture         = "ARM64"
  execution_role_arn       = aws_iam_role.execution.arn
  task_role_arn            = aws_iam_role.task.arn
  common_tags              = local.common_tags

  volumes = [{
    name = "uploads"
    efs  = { file_system_id = data.aws_efs_file_system.html.id, access_point_id = aws_efs_access_point.hello.id }
  }]
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
| [aws_ecs_task_definition.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_container_definitions"></a> [container\_definitions](#input\_container\_definitions) | A list of valid container definitions provided as a single valid JSON document. | `string` | n/a | yes |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | CPU units for the whole task. null leaves it to the container definitions (EC2 only) | `string` | `"256"` | no |
| <a name="input_cpu_architecture"></a> [cpu\_architecture](#input\_cpu\_architecture) | ARM64 or X86\_64. Sets the runtime platform, so the task only places on hosts of that architecture; null leaves it out | `string` | `null` | no |
| <a name="input_execution_role_arn"></a> [execution\_role\_arn](#input\_execution\_role\_arn) | Role ECS uses to start the task: pull images, write logs, read secrets. Falls back to role\_arn | `string` | `null` | no |
| <a name="input_family"></a> [family](#input\_family) | A unique name for your task definition. | `string` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | Memory (MiB) for the whole task. null leaves it to the container definitions (EC2 only) | `string` | `"512"` | no |
| <a name="input_network_mode"></a> [network\_mode](#input\_network\_mode) | The Docker networking mode - none, bridge, awsvpc or host. | `string` | `""` | no |
| <a name="input_requires_compatibilities"></a> [requires\_compatibilities](#input\_requires\_compatibilities) | The launch type required by the task: EC2 or FARGATE | `string` | `""` | no |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | One role used as both the execution role and the task role. Prefer execution\_role\_arn and task\_role\_arn | `string` | `""` | no |
| <a name="input_skip_destroy"></a> [skip\_destroy](#input\_skip\_destroy) | Keep old revisions registered when Terraform replaces the task definition | `bool` | `false` | no |
| <a name="input_task_role_arn"></a> [task\_role\_arn](#input\_task\_role\_arn) | Role the running containers use to call AWS. Falls back to role\_arn | `string` | `null` | no |
| <a name="input_task_tags"></a> [task\_tags](#input\_task\_tags) | Additional tags for the task definition | `map(string)` | `{}` | no |
| <a name="input_volumes"></a> [volumes](#input\_volumes) | Task volumes. For EFS, give the file system and an access point (IAM authorisation on by default) or a root directory; transit encryption is always on | <pre>list(object({<br/>    name      = string<br/>    host_path = optional(string)<br/>    efs = optional(object({<br/>      file_system_id  = string<br/>      access_point_id = optional(string)<br/>      root_directory  = optional(string, "/")<br/>      iam             = optional(string, "ENABLED")<br/>    }))<br/>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_arn_without_revision"></a> [arn\_without\_revision](#output\_arn\_without\_revision) | The task definition ARN without its revision, for IAM policies that cover every revision |
| <a name="output_definition_arn"></a> [definition\_arn](#output\_definition\_arn) | n/a |
| <a name="output_definition_id"></a> [definition\_id](#output\_definition\_id) | n/a |
| <a name="output_definition_revision"></a> [definition\_revision](#output\_definition\_revision) | n/a |
| <a name="output_family"></a> [family](#output\_family) | n/a |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | n/a |
<!-- END_TF_DOCS -->
