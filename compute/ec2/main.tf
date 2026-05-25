# -----------------------------------------------------------------------------
# EC2 instance
# -----------------------------------------------------------------------------

resource "aws_instance" "ec2" {
  ami = var.image_id

  instance_type = var.instance_type
  key_name      = var.ssh_key_name

  subnet_id                   = var.subnet_ids[0]
  associate_public_ip_address = var.require_public_ip

  ebs_optimized           = var.ebs_optimized
  disable_api_termination = var.disable_api_termination
  iam_instance_profile    = var.iam_profile_id != "" ? var.iam_profile_id : null

  vpc_security_group_ids = var.security_group_ids

  tags = merge(var.common_tags, { Name = var.name })
}
