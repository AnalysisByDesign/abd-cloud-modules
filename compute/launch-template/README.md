# compute/launch-template

Creates an EC2 launch template for use with an Auto Scaling Group. Configures instance type, AMI, key pair, security groups, IAM instance profile, EBS volume settings, and user data.

## Overview

User data is passed as a base64-encoded script, allowing arbitrary instance initialisation logic (install packages, pull application code, register with configuration management, etc.). The launch template is versioned by AWS — the ASG module always references `$Latest`, so updates to the launch template automatically become available for new instances on the next scale-out event.

## Usage

```hcl
module "app_lt" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//compute/launch-template?ref=v1.0.0"

  name                    = "my-app"
  ami_id                  = data.aws_ami.amazon_linux.id
  instance_type           = "t3.medium"
  key_name                = module.ssh_key.key_name
  security_group_ids      = [module.app_sg.id]
  iam_instance_profile    = module.app_role.instance_profile_name
  user_data               = base64encode(templatefile("./scripts/userdata.sh", { env = "prod" }))
  common_tags             = local.common_tags
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
| [aws_launch_template.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_disable_api_termination"></a> [disable\_api\_termination](#input\_disable\_api\_termination) | Disable API termination of instance | `bool` | `false` | no |
| <a name="input_ec2_instance_type"></a> [ec2\_instance\_type](#input\_ec2\_instance\_type) | The EC2 instance type to build | `string` | `"t3.micro"` | no |
| <a name="input_iam_profile_id"></a> [iam\_profile\_id](#input\_iam\_profile\_id) | IAM instance profile to use for EC2 instances | `string` | `""` | no |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | The EC2 AMI image id | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name prefix of the EC2 instances | `string` | n/a | yes |
| <a name="input_require_public_ip"></a> [require\_public\_ip](#input\_require\_public\_ip) | Do the EC2 resources need a public IP | `bool` | `false` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | A list of security group ids for the auto-scaling instance | `list(string)` | n/a | yes |
| <a name="input_ssh_key_name"></a> [ssh\_key\_name](#input\_ssh\_key\_name) | SSH key name to apply | `string` | `""` | no |
| <a name="input_user_data_script"></a> [user\_data\_script](#input\_user\_data\_script) | User data script to inject into the launch template | `string` | `""` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_id"></a> [id](#output\_id) | The ID of the launch template |
| <a name="output_latest_version"></a> [latest\_version](#output\_latest\_version) | The latest version of the launch template |
| <a name="output_name"></a> [name](#output\_name) | The name of the launch template |
<!-- END_TF_DOCS -->
