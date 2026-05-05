# -----------------------------------------------------------------------------
# ssl-certs.tf
#
# DNS validation is used exclusively as it allows Terraform to verify
# certificates automatically via Route53 records.
#
# Certificates for CloudFront must be created in us-east-1; the aws.acm_custom
# provider alias handles cross-region creation.
# -----------------------------------------------------------------------------

resource "aws_acm_certificate" "this" {
  count = var.required ? 1 : 0

  provider                  = aws.acm_custom
  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method         = "DNS"

  tags = merge(var.common_tags, var.acm_tags, { Name = var.domain_name })

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "cert_validation" {
  for_each = var.required ? {
    for dvo in aws_acm_certificate.this[0].domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  } : {}

  name    = each.value.name
  type    = each.value.type
  zone_id = var.r53_zone_id
  records = [each.value.record]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "this" {
  count = var.required ? 1 : 0

  provider                = aws.acm_custom
  certificate_arn         = aws_acm_certificate.this[0].arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}
