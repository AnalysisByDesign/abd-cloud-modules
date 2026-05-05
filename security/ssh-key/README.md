# security/ssh-key

Creates an EC2 key pair by importing a public key, enabling SSH access to instances that reference the key pair by name.

## Overview

The public key material is read from a file path or passed as a string. The private key is never stored in Terraform state — only the public key fingerprint is recorded. Key rotation requires creating a new key pair with a different name and updating all launch templates or instance resources that reference it.

## Usage

```hcl
module "app_key" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//security/ssh-key?ref=v1.0.0"

  name       = "my-app"
  public_key = file("~/.ssh/id_rsa.pub")
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
| [aws_key_pair.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_name"></a> [name](#input\_name) | Name of SSH key to upload | `string` | n/a | yes |
| <a name="input_public_key_file"></a> [public\_key\_file](#input\_public\_key\_file) | Physical file location of public key part to upload | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
