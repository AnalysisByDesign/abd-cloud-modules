# network/dns/delegation-set

Creates a Route53 reusable delegation set that assigns a fixed set of name servers to hosted zones.

## Overview

A delegation set ensures that all zones referencing it share the same four Route53 name servers. This allows DNS nameserver records to be pre-registered with domain registrars before the hosted zone content exists, and means zone recreation does not require nameserver updates at the registrar.

## Usage

```hcl
module "delegation_set" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//network/dns/delegation-set?ref=v1.0.0"

  reference_name = "abd-global"
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
