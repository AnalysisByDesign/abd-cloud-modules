# compute/alb

Creates an Application Load Balancer with an HTTPS listener (port 443), an HTTP→HTTPS redirect listener (port 80), a target group with configurable health checks, and an optional WAFv2 web ACL association.

## Overview

The ALB is configured as internet-facing by default (`internal = false`). The HTTPS listener forwards to the target group; the HTTP listener issues a 301 redirect to HTTPS. Target group health check parameters are fully configurable including path, interval, timeout, and success codes.

The SSL policy defaults to `ELBSecurityPolicy-TLS13-1-2-2021-06`, which enforces TLS 1.3/1.2 and drops legacy cipher suites. Override `ssl_policy` explicitly if a different policy is required for compatibility.

WAFv2 association is opt-in via `waf_enabled = true` with a corresponding `waf_web_acl_arn`.

## Usage

```hcl
module "app_alb" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//compute/alb?ref=v1.0.0"

  name               = "my-app"
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.vpc.public_subnet_ids
  security_group_ids = [module.alb_sg.id]
  acm_arn            = module.ssl_cert.cert_validation_arn
  common_tags        = local.common_tags
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
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.46.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_lb.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.actual](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.redirect](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_wafv2_web_acl_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_acm_arn"></a> [acm\_arn](#input\_acm\_arn) | SSL cert ARN to add to listener. | `string` | n/a | yes |
| <a name="input_alb_tags"></a> [alb\_tags](#input\_alb\_tags) | Additional tags for the LB | `map(string)` | `{}` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_healthy_threshold"></a> [healthy\_threshold](#input\_healthy\_threshold) | The number of consecutive health checks successes required before considering an unhealthy target healthy. | `string` | `"2"` | no |
| <a name="input_internal"></a> [internal](#input\_internal) | Is this ALB internal | `bool` | `false` | no |
| <a name="input_interval"></a> [interval](#input\_interval) | The approximate amount of time, in seconds, between health checks of an individual target. | `string` | `"60"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the ALB. | `string` | n/a | yes |
| <a name="input_path"></a> [path](#input\_path) | The destination for the health check request. | `string` | `"/"` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | A list of security group IDs to assign to the LB. | `list(string)` | n/a | yes |
| <a name="input_ssl_policy"></a> [ssl\_policy](#input\_ssl\_policy) | ELB SSL/TLS security policy name | `string` | `"ELBSecurityPolicy-TLS13-1-2-2021-06"` | no |
| <a name="input_stickiness_enabled"></a> [stickiness\_enabled](#input\_stickiness\_enabled) | Enable sticky sessions between the load balancer and application instances | `bool` | `false` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | A list of subnet IDs to attach to the LB. | `list(string)` | n/a | yes |
| <a name="input_success_code"></a> [success\_code](#input\_success\_code) | The HTTP codes to use when checking for a successful response from a target. | `string` | `"200,301,302"` | no |
| <a name="input_target_type"></a> [target\_type](#input\_target\_type) | The target type for the group - instance or ip | `string` | `"instance"` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | The amount of time, in seconds, during which no response means a failed health check. | `string` | `"10"` | no |
| <a name="input_unhealthy_threshold"></a> [unhealthy\_threshold](#input\_unhealthy\_threshold) | The number of consecutive health check failures required before considering the target unhealthy. | `string` | `"10"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The identifier of the VPC in which to create the target group | `string` | n/a | yes |
| <a name="input_waf_enabled"></a> [waf\_enabled](#input\_waf\_enabled) | Enable WAFv2 web ACL association with the ALB | `bool` | `false` | no |
| <a name="input_waf_web_acl_arn"></a> [waf\_web\_acl\_arn](#input\_waf\_web\_acl\_arn) | ARN of the WAFv2 web ACL to associate with the ALB | `string` | `""` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | n/a |
| <a name="output_alb_zone_id"></a> [alb\_zone\_id](#output\_alb\_zone\_id) | n/a |
| <a name="output_aws_lb_listener_arn"></a> [aws\_lb\_listener\_arn](#output\_aws\_lb\_listener\_arn) | n/a |
| <a name="output_aws_lb_listener_id"></a> [aws\_lb\_listener\_id](#output\_aws\_lb\_listener\_id) | n/a |
| <a name="output_target_group_arn"></a> [target\_group\_arn](#output\_target\_group\_arn) | n/a |
| <a name="output_target_group_id"></a> [target\_group\_id](#output\_target\_group\_id) | n/a |
| <a name="output_target_group_name"></a> [target\_group\_name](#output\_target\_group\_name) | n/a |
<!-- END_TF_DOCS -->
