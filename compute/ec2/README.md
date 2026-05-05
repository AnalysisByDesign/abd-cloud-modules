# compute/ec2

Creates a single EC2 instance with configurable AMI, instance type, subnet placement, SSH key, and optional public IP assignment.

## Overview

Intended for standalone instances such as bastion hosts or single-node services where an Auto Scaling Group is unnecessary. For scalable application tiers, use `compute/launch-template` and `compute/asg` instead.

## Usage

```hcl
module "bastion" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//compute/ec2?ref=v1.0.0"

  name               = "bastion"
  ami_id             = data.aws_ami.amazon_linux.id
  instance_type      = "t3.micro"
  subnet_id          = module.vpc.public_subnet_ids[0]
  key_name           = module.ssh_key.key_name
  security_group_ids = [module.bastion_sg.id]
  associate_public_ip = true
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
| [aws_instance.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_count"></a> [count](#input\_count) | n/a | `number` | `1` | no |
| <a name="input_disable_api_termination"></a> [disable\_api\_termination](#input\_disable\_api\_termination) | Disable API termination of instance | `bool` | `false` | no |
| <a name="input_ebs_optimized"></a> [ebs\_optimized](#input\_ebs\_optimized) | Enable EBS optimized | `bool` | `true` | no |
| <a name="input_iam_profile_id"></a> [iam\_profile\_id](#input\_iam\_profile\_id) | IAM instance profile to use for EC2 instances | `string` | `""` | no |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | The EC2 AMI image id | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The EC2 instance type to build | `string` | `"t3.micro"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name prefix of the EC2 instances | `string` | n/a | yes |
| <a name="input_require_public_ip"></a> [require\_public\_ip](#input\_require\_public\_ip) | Do the EC2 resources need a public IP | `bool` | `false` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | A list of security group ids for the auto-scaling instance | `list(string)` | n/a | yes |
| <a name="input_ssh_key_name"></a> [ssh\_key\_name](#input\_ssh\_key\_name) | SSH key name to apply | `string` | `""` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The VPC subnet ids to deploy instances into | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_id"></a> [id](#output\_id) | The id of the EC2 instance |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | The private IP address of the EC2 instance |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | The public IP address of the EC2 instance |
<!-- END_TF_DOCS -->
