# -----------------------------------------------------------------------------
# EC2 instance
# -----------------------------------------------------------------------------

resource "aws_instance" "this" {
  ami = "${var.image_id}"

  instance_type = "${var.instance_type}"
  key_name      = "${var.ssh_key_name}"

  subnet_id                   = "${var.subnet_ids[0]}"
  associate_public_ip_address = "${var.require_public_ip ? 1 : 0}"

  ebs_optimized           = "${var.ebs_optimized}"
  disable_api_termination = "${var.disable_api_termination }"

  vpc_security_group_ids = ["${var.security_group_ids}"]

  tags = "${merge(var.common_tags, map("Name", format("%s", var.name)))}"
}
