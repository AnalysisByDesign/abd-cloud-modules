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
<!-- END_TF_DOCS -->
