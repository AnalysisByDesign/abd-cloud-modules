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
<!-- END_TF_DOCS -->
