# security/iam-role

Creates one or more IAM roles from a list of role definitions, each with a custom assume-role policy and a single attached managed policy.

## Overview

The `roles` input accepts a list of role definition objects, enabling multiple roles to be declared in a single module call. Each role definition specifies the role name, description, path, assume-role policy JSON, and the ARN of one managed policy to attach. For roles requiring multiple policy attachments, call the module once per role or attach additional policies outside the module.

## Usage

```hcl
module "app_role" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//security/iam-role?ref=v1.0.0"

  roles = [{
    name               = "my-app-role"
    description        = "Role assumed by EC2 instances running the application"
    assume_role_policy = data.aws_iam_policy_document.ec2_trust.json
    policy_arn         = aws_iam_policy.app_policy.arn
  }]
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
