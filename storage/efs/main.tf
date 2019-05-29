# -----------------------------------------------------------------------------
# efs.tf
# -----------------------------------------------------------------------------

resource "aws_efs_file_system" "this" {
  creation_token   = "${var.name            }"
  performance_mode = "${var.performance_mode}"
  encrypted        = "${var.encrypted       }"
  kms_key_id       = "${var.kms_key_id      }"

  tags = "${merge(var.common_tags, var.efs_tags, map("Name", format("%s", var.name)))}"
}
