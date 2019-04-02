# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

output "id" {
  value = "${aws_acm_certificate.this.*.id}"
}

output "arn" {
  value = "${aws_acm_certificate.this.*.arn}"
}

output "domain_validation_options" {
  value = ["${aws_acm_certificate.this.*.domain_validation_options}"]
}

output "cert_validation_arn" {
  value = ["${aws_acm_certificate_validation.this.*.certificate_arn}"]
}
