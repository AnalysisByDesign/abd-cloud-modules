# compute/nlb

Creates a Network Load Balancer for TCP-based traffic with a target group, TCP listener, and configurable health checks.

## Overview

NLBs operate at Layer 4 and are suited to workloads requiring static IP addresses, ultra-low latency, or TLS pass-through. Unlike the ALB module, no HTTPS termination is performed — the NLB forwards raw TCP traffic to targets.

## Usage

```hcl
module "app_nlb" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//compute/nlb?ref=v1.0.0"

  name        = "my-app"
  subnet_ids  = module.vpc.public_subnet_ids
  vpc_id      = module.vpc.vpc_id
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
| [aws_lb.nlb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.front_end](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.nlb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_cross_zone_load_balancing"></a> [cross\_zone\_load\_balancing](#input\_cross\_zone\_load\_balancing) | Enable cross zone load balancing | `bool` | `true` | no |
| <a name="input_healthcheck_healthy_threshold"></a> [healthcheck\_healthy\_threshold](#input\_healthcheck\_healthy\_threshold) | Healthcheck healthy threshold | `string` | `"2"` | no |
| <a name="input_healthcheck_interval"></a> [healthcheck\_interval](#input\_healthcheck\_interval) | Healthcheck interval | `string` | `"30"` | no |
| <a name="input_healthcheck_unhealthy_threshold"></a> [healthcheck\_unhealthy\_threshold](#input\_healthcheck\_unhealthy\_threshold) | Healthcheck unhealthy threshold | `string` | `"2"` | no |
| <a name="input_ingress_port"></a> [ingress\_port](#input\_ingress\_port) | The ingress port for the LB to listen on | `string` | `"22"` | no |
| <a name="input_instance_port"></a> [instance\_port](#input\_instance\_port) | The instance port for the LB to connect to | `string` | `"22"` | no |
| <a name="input_lb_tags"></a> [lb\_tags](#input\_lb\_tags) | Additional tags for the NLB | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the load balancer | `string` | n/a | yes |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | Should be one of TCP, HTTP, HTTPS or TLS. | `string` | `"TCP"` | no |
| <a name="input_slow_start"></a> [slow\_start](#input\_slow\_start) | Slow start timeout before sending requests to the host | `string` | `"30"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The VPC subnet ids to load balance across | `list(string)` | n/a | yes |
| <a name="input_target_type"></a> [target\_type](#input\_target\_type) | LB target instance type | `string` | `"instance"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC id for the target group | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_lb_arn"></a> [lb\_arn](#output\_lb\_arn) | The arn of the Elastic Load Balancer |
| <a name="output_lb_arn_suffix"></a> [lb\_arn\_suffix](#output\_lb\_arn\_suffix) | The arn suffix for CloudWatch metrics |
| <a name="output_lb_dns_name"></a> [lb\_dns\_name](#output\_lb\_dns\_name) | The DNS name of the Elastic Load Balancer |
| <a name="output_lb_id"></a> [lb\_id](#output\_lb\_id) | The ID of the Elastic Load Balancer |
| <a name="output_lb_zone_id"></a> [lb\_zone\_id](#output\_lb\_zone\_id) | The hosted zone id of the LB |
| <a name="output_tg_arn"></a> [tg\_arn](#output\_tg\_arn) | The arn of the Target Group |
| <a name="output_tg_arn_suffix"></a> [tg\_arn\_suffix](#output\_tg\_arn\_suffix) | The arn suffix for CloudWatch metrics |
| <a name="output_tg_id"></a> [tg\_id](#output\_tg\_id) | The ID of the Target Group |
<!-- END_TF_DOCS -->
