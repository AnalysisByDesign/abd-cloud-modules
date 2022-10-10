# -----------------------------------------------------------------------------
# ssl-certs.tf
#
# We will force the use of DNS as the validaton method when creating certificates
# as this allows us to automatically verify them via Terraform
#
# In order to use custom SSL certs with CloudFront, we need to create them in 
# us-east-1 rather than our chosen region. This is only required for the cert
# and not for the validation records, etc.
# -----------------------------------------------------------------------------

provider "aws" {
  alias   = "acm_custom"

  region = var.certificate_region

  assume_role {
    role_arn = "arn:aws:iam::${var.acct_target}:role/${var.acct_target_role == ""
      ? "terraform"
    : var.acct_target_role}"
  }
}
