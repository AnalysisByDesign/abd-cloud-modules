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

resource "aws_acm_certificate" "this" {
  count = "${var.required ? 1 : 0}"

  provider                  = "aws.acm_custom"
  domain_name               = "${var.domain_name}"
  subject_alternative_names = ["${var.subject_alternative_names}"]
  validation_method         = "DNS"

  tags = "${merge(var.common_tags, var.acm_tags, map("Name", format("%s", var.domain_name)))}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "this" {
  count = "${var.required ? 1 : 0}"

  provider                = "aws.acm_custom"
  certificate_arn         = "${aws_acm_certificate.this.0.arn}"
  validation_record_fqdns = ["${aws_route53_record.cert_validation.0.fqdn}"]
}

resource "aws_route53_record" "cert_validation" {
  count = "${var.required ? 1 : 0}"

  provider = "aws.acm_custom"
  name     = "${aws_acm_certificate.this.0.domain_validation_options.0.resource_record_name}"
  type     = "${aws_acm_certificate.this.0.domain_validation_options.0.resource_record_type}"
  zone_id  = "${var.r53_zone_id}"
  records  = ["${aws_acm_certificate.this.0.domain_validation_options.0.resource_record_value}"]
  ttl      = 60
}
