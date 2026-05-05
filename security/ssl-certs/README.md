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
<!-- END_TF_DOCS -->
