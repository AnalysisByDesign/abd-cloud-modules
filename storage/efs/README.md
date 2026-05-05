# storage/efs

Creates an EFS file system with mount targets in each supplied subnet and a Route53 DNS record pointing to the file system's DNS name.

## Overview

The file system is created with configurable performance mode and optional KMS encryption. Mount targets are created for each subnet ID in the `subnet_ids` list, making the file system accessible from instances in those subnets. A Route53 CNAME record is created in the specified private hosted zone to provide a stable, human-readable endpoint.

## Usage

```hcl
module "shared_storage" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//storage/efs?ref=v1.0.0"

  name             = "wordpress-media"
  subnet_ids       = module.vpc.private_subnet_ids
  security_group_ids = [module.efs_sg.id]
  zone_id          = module.dns.private_zone_id
  common_tags      = local.common_tags
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
| [aws_efs_file_system.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_file_system) | resource |
| [aws_efs_mount_target.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_mount_target) | resource |
| [aws_route53_record.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_efs_tags"></a> [efs\_tags](#input\_efs\_tags) | Additional tags for the EFS volume | `map(string)` | `{}` | no |
| <a name="input_encrypted"></a> [encrypted](#input\_encrypted) | Create an encrypted data volume | `bool` | `true` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | Create an encrypted data volume | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the EFS volume | `any` | n/a | yes |
| <a name="input_performance_mode"></a> [performance\_mode](#input\_performance\_mode) | The performance mode of the EFS filesystem | `string` | `"generalPurpose"` | no |
| <a name="input_route53_name"></a> [route53\_name](#input\_route53\_name) | Friendly name for route53 entry | `string` | `""` | no |
| <a name="input_route53_zone_id"></a> [route53\_zone\_id](#input\_route53\_zone\_id) | The Route53 zone id to put the R53 records in | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | A list of security group ids for the EFS volume | `list(string)` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | A list of subnet ids inside the VPC | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | The DNS name of the EFS volume |
| <a name="output_id"></a> [id](#output\_id) | The ID of the EFS volume |
| <a name="output_kms_key_id"></a> [kms\_key\_id](#output\_kms\_key\_id) | The KMS key ID of the EFS volume |
<!-- END_TF_DOCS -->
