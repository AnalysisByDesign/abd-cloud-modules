# -----------------------------------------------------------------------------
# EFS mount targets
# -----------------------------------------------------------------------------

resource "aws_efs_mount_target" "this" {
  count = "${length(var.subnet_ids)}"

  subnet_id       = "${element(var.subnet_ids, count.index)}"
  file_system_id  = "${aws_efs_file_system.this.id}"
  security_groups = ["${var.security_group_ids}"]
}
