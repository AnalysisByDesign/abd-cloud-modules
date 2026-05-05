# compute/elb

Creates a Classic Elastic Load Balancer (ELB) with configurable listeners, health checks, and cross-zone load balancing.

> **Note:** Classic ELB is a legacy resource. New workloads should use `compute/alb` (Application Load Balancer) or `compute/nlb` (Network Load Balancer). This module is retained for backwards compatibility with existing infrastructure.

## Usage

```hcl
module "legacy_lb" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//compute/elb?ref=v1.0.0"

  name               = "my-app"
  subnet_ids         = module.vpc.public_subnet_ids
  security_group_ids = [module.lb_sg.id]
  common_tags        = local.common_tags
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
| [aws_elb.elb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elb) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_connection_draining"></a> [connection\_draining](#input\_connection\_draining) | Enable connection draining | `bool` | `true` | no |
| <a name="input_connection_draining_timeout"></a> [connection\_draining\_timeout](#input\_connection\_draining\_timeout) | Connection draining timeout | `string` | `"300"` | no |
| <a name="input_cross_zone_load_balancing"></a> [cross\_zone\_load\_balancing](#input\_cross\_zone\_load\_balancing) | Enable cross zone load balancing | `bool` | `true` | no |
| <a name="input_elb_tags"></a> [elb\_tags](#input\_elb\_tags) | Additional tags for the LB | `map(string)` | `{}` | no |
| <a name="input_healthcheck_healthy_threshold"></a> [healthcheck\_healthy\_threshold](#input\_healthcheck\_healthy\_threshold) | Healthcheck healthy threshold | `string` | `"2"` | no |
| <a name="input_healthcheck_interval"></a> [healthcheck\_interval](#input\_healthcheck\_interval) | Healthcheck interval | `string` | `"30"` | no |
| <a name="input_healthcheck_target"></a> [healthcheck\_target](#input\_healthcheck\_target) | Healthcheck target - defaults to instance\_protocol:instance\_port | `string` | `""` | no |
| <a name="input_healthcheck_timeout"></a> [healthcheck\_timeout](#input\_healthcheck\_timeout) | Healthcheck timeout | `string` | `"3"` | no |
| <a name="input_healthcheck_unhealthy_threshold"></a> [healthcheck\_unhealthy\_threshold](#input\_healthcheck\_unhealthy\_threshold) | Healthcheck unhealthy threshold | `string` | `"2"` | no |
| <a name="input_idle_timeout"></a> [idle\_timeout](#input\_idle\_timeout) | Idle timeout | `string` | `"60"` | no |
| <a name="input_instance_port"></a> [instance\_port](#input\_instance\_port) | Outbound load balancer port number to instance | `string` | `"80"` | no |
| <a name="input_instance_protocol"></a> [instance\_protocol](#input\_instance\_protocol) | Outbound load balancer protocol to instance | `string` | `"TCP"` | no |
| <a name="input_lb_port"></a> [lb\_port](#input\_lb\_port) | Inbound load balancer port number | `string` | `"80"` | no |
| <a name="input_lb_protocol"></a> [lb\_protocol](#input\_lb\_protocol) | Inbound load balancer protocol | `string` | `"TCP"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the load balancer | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | A list of security group ids for the auto-scaling instance | `list(string)` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The VPC subnet ids to deploy instances into | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_arn"></a> [arn](#output\_arn) | The arn of the Elastic Load Balancer |
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | The DNS name of the Elastic Load Balancer |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Elastic Load Balancer |
| <a name="output_instances"></a> [instances](#output\_instances) | The instances attached to the LB |
| <a name="output_name"></a> [name](#output\_name) | The name of the Elastic Load Balancer |
| <a name="output_source_security_group_id"></a> [source\_security\_group\_id](#output\_source\_security\_group\_id) | The security group id to be used for inbound to backend instances |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | The hosted zone id of the LB |
<!-- END_TF_DOCS -->
