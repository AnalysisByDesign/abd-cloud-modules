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
<!-- END_TF_DOCS -->
