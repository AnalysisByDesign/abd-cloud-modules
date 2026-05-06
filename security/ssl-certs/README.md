# security/ssl-certs

Creates an ACM certificate with DNS validation records in Route53, and waits for the certificate to be issued before completing.

## Overview

Certificate validation uses the modern `for_each` pattern on `domain_validation_options`, creating one Route53 record per unique validation domain. This handles wildcard certificates and certificates with Subject Alternative Names (SANs) correctly.

The certificate can be created in a region different from the caller's provider region by configuring the `aws.acm_custom` provider alias — required for CloudFront certificates which must be in `us-east-1`.

Set `required = false` to skip certificate creation entirely (useful for environments where an existing certificate ARN is passed in instead).

## Usage

```hcl
module "ssl_cert" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//security/ssl-certs?ref=v1.0.0"

  domain_name               = "example.co.uk"
  subject_alternative_names = ["www.example.co.uk"]
  zone_id                   = module.public_zone.zone_id
  common_tags               = local.common_tags
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.100.0 |
| <a name="provider_aws.acm_custom"></a> [aws.acm\_custom](#provider\_aws.acm\_custom) | 5.100.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_acm_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_route53_record.cert_validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_acct_target"></a> [acct\_target](#input\_acct\_target) | Target AWS account to build infrastructure into | `string` | n/a | yes |
| <a name="input_acct_target_role"></a> [acct\_target\_role](#input\_acct\_target\_role) | Role in target account to assume when building infrastructure | `string` | `""` | no |
| <a name="input_acm_tags"></a> [acm\_tags](#input\_acm\_tags) | Additional tags for CloudFront | `map(string)` | <pre>{<br/>  "Component": "acm"<br/>}</pre> | no |
| <a name="input_certificate_region"></a> [certificate\_region](#input\_certificate\_region) | Region in which we want to create our certificate. | `string` | `"us-east-1"` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name for ACM cert | `string` | n/a | yes |
| <a name="input_r53_zone_id"></a> [r53\_zone\_id](#input\_r53\_zone\_id) | Zone id for r53 public zone | `string` | n/a | yes |
| <a name="input_required"></a> [required](#input\_required) | Do we need to create an SSL cert | `bool` | `false` | no |
| <a name="input_subject_alternative_names"></a> [subject\_alternative\_names](#input\_subject\_alternative\_names) | n/a | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_cert_validation_arn"></a> [cert\_validation\_arn](#output\_cert\_validation\_arn) | n/a |
| <a name="output_domain_validation_options"></a> [domain\_validation\_options](#output\_domain\_validation\_options) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
<!-- END_TF_DOCS -->
