# compute/asg

Creates an EC2 Auto Scaling Group that references an existing launch template by ID.

## Overview

The ASG is configured with minimum, maximum, and desired instance counts. It uses a launch template reference (`$Latest` version) and supports attaching to load balancer target groups. Instance tags are propagated to launched instances via the `tags` block. Health checks default to `EC2` type but can be switched to `ELB` for load-balanced workloads.

This module is intended to be used alongside `compute/launch-template` — the launch template is created separately and its ID is passed to this module.

## Usage

```hcl
module "app_asg" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//compute/asg?ref=v1.0.0"

  name               = "my-app"
  min_size           = 1
  max_size           = 4
  desired_capacity   = 2
  launch_template_id = module.launch_template.id
  subnet_ids         = module.vpc.private_subnet_ids
  target_group_arns  = [module.alb.target_group_arn]
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
| [aws_autoscaling_group.asg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_capacity_timeout"></a> [capacity\_timeout](#input\_capacity\_timeout) | Maximum | `string` | `"600s"` | no |
| <a name="input_default_cooldown"></a> [default\_cooldown](#input\_default\_cooldown) | Cooldown period before allowing another autoscaling action | `string` | `"120"` | no |
| <a name="input_delete_timeout"></a> [delete\_timeout](#input\_delete\_timeout) | Delete timeout setting | `string` | `"15m"` | no |
| <a name="input_desired_capacity"></a> [desired\_capacity](#input\_desired\_capacity) | Desired size of the autoscaling group | `string` | `"1"` | no |
| <a name="input_enabled_metrics"></a> [enabled\_metrics](#input\_enabled\_metrics) | What metrics to monitor | `list(string)` | <pre>[<br/>  "GroupMinSize",<br/>  "GroupMaxSize",<br/>  "GroupDesiredCapacity",<br/>  "GroupInServiceInstances",<br/>  "GroupPendingInstances",<br/>  "GroupStandbyInstances",<br/>  "GroupTerminatingInstances",<br/>  "GroupTotalInstances"<br/>]</pre> | no |
| <a name="input_force_delete"></a> [force\_delete](#input\_force\_delete) | Force delete of autoscaling group if instances not terminating | `string` | `"false"` | no |
| <a name="input_health_check_grace_period"></a> [health\_check\_grace\_period](#input\_health\_check\_grace\_period) | Maximum | `string` | `"240"` | no |
| <a name="input_health_check_type"></a> [health\_check\_type](#input\_health\_check\_type) | Maximum | `string` | `"ELB"` | no |
| <a name="input_launch_template_id"></a> [launch\_template\_id](#input\_launch\_template\_id) | Launch template\_id to use | `string` | n/a | yes |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | Maximum size of the autoscaling group | `string` | `"1"` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | Minimum size of the autoscaling group | `string` | `"1"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name prefix of the EC2 instances | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The VPC subnet ids to deploy instances into | `list(string)` | n/a | yes |
| <a name="input_tag_map"></a> [tag\_map](#input\_tag\_map) | A list of tag maps to add to all resources | `list(string)` | n/a | yes |
| <a name="input_target_group_arns"></a> [target\_group\_arns](#input\_target\_group\_arns) | Load balancer arns to attach instances to | `list(string)` | `[]` | no |
| <a name="input_termination_policies"></a> [termination\_policies](#input\_termination\_policies) | Termination policies to apply to instances | `list(string)` | <pre>[<br/>  "default"<br/>]</pre> | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_arn"></a> [arn](#output\_arn) | The arn of the AutoScaling Group |
| <a name="output_id"></a> [id](#output\_id) | The ID of the AutoScaling Group |
| <a name="output_name"></a> [name](#output\_name) | The name of the AutoScaling Group |
<!-- END_TF_DOCS -->
