# network/dns/public-zone

Creates one or more Route53 public hosted zones. Supports a single zone name or a list of search domains for batch creation.

## Overview

When `search_domains` is provided, one zone is created per domain in the list. When only `search_domain` (singular) is provided, `coalescelist` falls back to that single value. Zone outputs are comma-joined strings of IDs and lists of name server arrays, allowing callers to extract per-zone values.

## Usage

```hcl
module "public_zone" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//network/dns/public-zone?ref=v1.0.0"

  search_domain = "example.co.uk"
  common_tags   = local.common_tags
}
```

Multiple zones:

```hcl
module "public_zones" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//network/dns/public-zone?ref=v1.0.0"

  search_domains = ["example.co.uk", "example.com"]
  common_tags    = local.common_tags
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
