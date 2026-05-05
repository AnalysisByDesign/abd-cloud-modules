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
| [aws_iam_role.iam-role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.iam-role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_path"></a> [path](#input\_path) | Path location for role to be created | `string` | `"/"` | no |
| <a name="input_required"></a> [required](#input\_required) | Do we need to build the roles | `number` | `1` | no |
| <a name="input_roles"></a> [roles](#input\_roles) | A list of role details | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_arns"></a> [arns](#output\_arns) | ARNs of the roles |
| <a name="output_names"></a> [names](#output\_names) | Names of the roles |
<!-- END_TF_DOCS -->
