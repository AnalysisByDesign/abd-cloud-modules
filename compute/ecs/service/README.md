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
| [aws_ecs_service.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | ARN of an ECS cluster | `string` | n/a | yes |
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | The name of the container to associate with the load balancer | `string` | n/a | yes |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | The port on the container to associate with the load balancer | `string` | n/a | yes |
| <a name="input_depends_on"></a> [depends\_on](#input\_depends\_on) | n/a | `list(string)` | `[]` | no |
| <a name="input_deployment_maximum_percent"></a> [deployment\_maximum\_percent](#input\_deployment\_maximum\_percent) | The lower percentage limit of the number of healthy tasks in a service during a deployment | `string` | `"200"` | no |
| <a name="input_deployment_minimum_healthy_percent"></a> [deployment\_minimum\_healthy\_percent](#input\_deployment\_minimum\_healthy\_percent) | The lower percentage limit of the number of healthy tasks in a service during a deployment | `string` | `"50"` | no |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | The number of instances of the task definition to place and keep running | `string` | `"1"` | no |
| <a name="input_launch_type"></a> [launch\_type](#input\_launch\_type) | The launch type on which to run your service. The valid values are EC2 and FARGATE. Defaults to EC2 | `string` | `"EC2"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the service (up to 255 letters, numbers, hyphens, and underscores) | `string` | n/a | yes |
| <a name="input_scheduling_strategy"></a> [scheduling\_strategy](#input\_scheduling\_strategy) | he scheduling strategy to use for the service. The valid values are REPLICA and DAEMON. Defaults to REPLICA | `string` | `"REPLICA"` | no |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | Security group id to associate with the created resources | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The subnets associated with the task or service | `list(string)` | n/a | yes |
| <a name="input_target_group_arn"></a> [target\_group\_arn](#input\_target\_group\_arn) | The ARN of the Load Balancer target group to associate with the service | `string` | n/a | yes |
| <a name="input_task_definition"></a> [task\_definition](#input\_task\_definition) | The family and revision (family:revision) or full ARN of the task definition | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_aws_ecs_service_id"></a> [aws\_ecs\_service\_id](#output\_aws\_ecs\_service\_id) | n/a |
<!-- END_TF_DOCS -->
