# compute/docker-repository

Creates an ECR (Elastic Container Registry) repository with an optional access policy and lifecycle policy for automated image cleanup.

## Overview

The repository is created with image tag immutability configurable (default mutable). An optional access policy controls which principals can pull or push images — useful for cross-account CI/CD pipelines. The lifecycle policy is passed as a JSON string, allowing arbitrary rules such as expiring untagged images after a set number of days or keeping only the latest N tagged images.

## Usage

```hcl
module "ecr" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//compute/docker-repository?ref=v1.0.0"

  name             = "my-application"
  lifecycle_policy = file("./files/ecr-lifecycle.json")
  common_tags      = local.common_tags
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
