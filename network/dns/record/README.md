# network/dns/record

Creates a Route53 DNS record of any type (A, AAAA, CNAME, MX, TXT, etc.) in an existing hosted zone.

## Usage

```hcl
module "dns_record" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//network/dns/record?ref=v1.0.0"

  zone_id = module.public_zone.zone_id
  name    = "api.example.co.uk"
  type    = "CNAME"
  ttl     = 300
  records = ["lb.example.co.uk"]
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

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_route53_record.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_name"></a> [name](#input\_name) | The name of the Route53 record | `string` | n/a | yes |
| <a name="input_records"></a> [records](#input\_records) | DNS records to add to route53 record | `list(string)` | n/a | yes |
| <a name="input_required"></a> [required](#input\_required) | Do we need to create this - can be disabled from within another module | `bool` | `true` | no |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | The TTL for the Route53 record | `string` | `"60"` | no |
| <a name="input_type"></a> [type](#input\_type) | The type of the Route53 record | `string` | `"A"` | no |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | The name of the Route53 zone to build the record in | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | The FQDN of the record |
| <a name="output_hosted_zone_id"></a> [hosted\_zone\_id](#output\_hosted\_zone\_id) | n/a |
<!-- END_TF_DOCS -->
