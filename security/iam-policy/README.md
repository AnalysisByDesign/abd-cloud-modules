# security/iam-policy

Creates an IAM policy from a rendered policy document string.

## Usage

```hcl
module "app_policy" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//security/iam-policy?ref=v1.0.0"

  name        = "my-app-policy"
  description = "Allows the application to read from S3 and write to SQS"
  policy      = data.aws_iam_policy_document.app.json
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
