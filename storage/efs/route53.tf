# -----------------------------------------------------------------------------
# efs-route53.tf.bak
# -----------------------------------------------------------------------------

resource "aws_route53_record" "this" {
  zone_id = var.route53_zone_id
  name    = format("efs-%s", var.route53_name != "" ? var.route53_name : var.name)
  type    = "CNAME"
  ttl     = "60"
  records = ["${aws_efs_mount_target.this.0.dns_name}"]
}
