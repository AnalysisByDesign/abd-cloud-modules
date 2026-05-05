# compute/ecs/service

Creates an ECS service that manages the lifecycle of long-running containerised tasks, including desired count, load balancer integration, and network configuration for Fargate tasks.

## Overview

Supports both EC2 and Fargate launch types. For Fargate, `network_configuration` must be provided with subnet IDs and security group IDs. The service connects to an ALB target group via the `load_balancer` block, enabling traffic routing once tasks pass health checks.

## Usage

```hcl
module "app_service" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//compute/ecs/service?ref=v1.0.0"

  name             = "my-app"
  cluster_id       = module.ecs_cluster.id
  task_definition  = module.app_task.arn
  desired_count    = 2
  target_group_arn = module.alb.target_group_arn
  container_name   = "app"
  container_port   = 8080
  subnet_ids       = module.vpc.private_subnet_ids
  security_group_ids = [module.app_sg.id]
  common_tags      = local.common_tags
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
