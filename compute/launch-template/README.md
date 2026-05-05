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
<!-- END_TF_DOCS -->
