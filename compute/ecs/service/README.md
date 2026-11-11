# compute/ecs/service

Creates an ECS service that keeps a number of tasks running, with optional load balancer, Cloud Map and capacity provider integration.

## Overview

- **Network mode**: `subnet_ids` and `security_group_ids` add a `network_configuration` (awsvpc). Leave them empty for bridge or host mode.
- **Placement**: a `capacity_provider_strategy` replaces `launch_type`. Leave both empty and set `launch_type = null` to use the cluster's default strategy.
- **Deployments**: the circuit breaker with rollback is on by default.
- **CI-owned revisions**: with `task_definition_managed_externally = true` the service is created from `task_definition`, after which Terraform ignores it, so revisions that CI registers and deploys are not reverted. This is a separate resource address (`aws_ecs_service.ci_managed`), so switching an existing service needs a `terraform state mv`.

## Usage

```hcl
module "service" {
  source = "../../../../abd-cloud-modules/compute/ecs/service"

  name            = "hello"
  cluster_id      = data.aws_ecs_cluster.this.arn
  task_definition = module.task.definition_arn
  common_tags     = local.common_tags

  task_definition_managed_externally = true
  launch_type                        = null
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200
  health_check_grace_period_seconds  = 60

  # Bridge mode with a dynamic host port
  load_balancers = [
    { target_group_arn = aws_lb_target_group.this.arn, container_name = "web", container_port = 8080 },
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
| [aws_ecs_service.ci_managed](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_service.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_capacity_provider_strategy"></a> [capacity\_provider\_strategy](#input\_capacity\_provider\_strategy) | Capacity provider strategy for the service. Leave empty to use launch\_type, or the cluster's default strategy when launch\_type is null | <pre>list(object({<br/>    capacity_provider = string<br/>    weight            = optional(number, 1)<br/>    base              = optional(number, 0)<br/>  }))</pre> | `[]` | no |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | ARN of an ECS cluster | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_deployment_circuit_breaker"></a> [deployment\_circuit\_breaker](#input\_deployment\_circuit\_breaker) | Stop a failing deployment and roll back to the last completed one | `bool` | `true` | no |
| <a name="input_deployment_maximum_percent"></a> [deployment\_maximum\_percent](#input\_deployment\_maximum\_percent) | The upper percentage limit of the number of running tasks in a service during a deployment | `string` | `"200"` | no |
| <a name="input_deployment_minimum_healthy_percent"></a> [deployment\_minimum\_healthy\_percent](#input\_deployment\_minimum\_healthy\_percent) | The lower percentage limit of the number of healthy tasks in a service during a deployment | `string` | `"50"` | no |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | The number of instances of the task definition to place and keep running | `string` | `"1"` | no |
| <a name="input_enable_execute_command"></a> [enable\_execute\_command](#input\_enable\_execute\_command) | Allow ECS Exec into the service's containers (the task role then needs the SSM messages permissions) | `bool` | `false` | no |
| <a name="input_health_check_grace_period_seconds"></a> [health\_check\_grace\_period\_seconds](#input\_health\_check\_grace\_period\_seconds) | Seconds to ignore failing load balancer health checks after a task starts. Only valid with a load balancer | `number` | `null` | no |
| <a name="input_launch_type"></a> [launch\_type](#input\_launch\_type) | The launch type (EC2, FARGATE or EXTERNAL). Ignored when capacity\_provider\_strategy is set | `string` | `"EC2"` | no |
| <a name="input_load_balancers"></a> [load\_balancers](#input\_load\_balancers) | Target groups to register the service's tasks with | <pre>list(object({<br/>    target_group_arn = string<br/>    container_name   = string<br/>    container_port   = number<br/>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the service (up to 255 letters, numbers, hyphens, and underscores) | `string` | n/a | yes |
| <a name="input_ordered_placement_strategy"></a> [ordered\_placement\_strategy](#input\_ordered\_placement\_strategy) | Task placement strategies, applied in order (e.g. spread by attribute:ecs.availability-zone, then binpack by memory) | <pre>list(object({<br/>    type  = string<br/>    field = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_placement_constraints"></a> [placement\_constraints](#input\_placement\_constraints) | Placement constraints, e.g. { type = "memberOf", expression = "attribute:ecs.instance-type =~ t4g.*" } or { type = "distinctInstance" } | <pre>list(object({<br/>    type       = string<br/>    expression = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_scheduling_strategy"></a> [scheduling\_strategy](#input\_scheduling\_strategy) | The scheduling strategy to use for the service. The valid values are REPLICA and DAEMON. Defaults to REPLICA | `string` | `"REPLICA"` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | Security groups for awsvpc network mode | `list(string)` | `[]` | no |
| <a name="input_service_registries"></a> [service\_registries](#input\_service\_registries) | Cloud Map service registries. awsvpc tasks need only registry\_arn (A records); bridge and host tasks need container\_name and container\_port (SRV records) | <pre>list(object({<br/>    registry_arn   = string<br/>    port           = optional(number)<br/>    container_name = optional(string)<br/>    container_port = optional(number)<br/>  }))</pre> | `[]` | no |
| <a name="input_service_tags"></a> [service\_tags](#input\_service\_tags) | Additional tags for the service | `map(string)` | `{}` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Subnets for awsvpc network mode. Leave empty for bridge or host mode | `list(string)` | `[]` | no |
| <a name="input_task_definition"></a> [task\_definition](#input\_task\_definition) | The family and revision (family:revision) or full ARN of the task definition | `string` | n/a | yes |
| <a name="input_task_definition_managed_externally"></a> [task\_definition\_managed\_externally](#input\_task\_definition\_managed\_externally) | CI registers new task definition revisions and updates the service, so Terraform ignores task\_definition after creating the service | `bool` | `false` | no |
| <a name="input_wait_for_steady_state"></a> [wait\_for\_steady\_state](#input\_wait\_for\_steady\_state) | Make apply wait until the service reaches a steady state | `bool` | `false` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_aws_ecs_service_id"></a> [aws\_ecs\_service\_id](#output\_aws\_ecs\_service\_id) | The ARN of the service |
| <a name="output_name"></a> [name](#output\_name) | The name of the service |
<!-- END_TF_DOCS -->
