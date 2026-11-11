# -----------------------------------------------------------------------------
# Launch template
# -----------------------------------------------------------------------------

resource "aws_launch_template" "this" {
  name_prefix                          = "${var.name}-"
  image_id                             = var.ami_id
  instance_type                        = var.ec2_instance_type
  disable_api_termination              = var.disable_api_termination
  ebs_optimized                        = true
  instance_initiated_shutdown_behavior = "stop"
  key_name                             = var.ssh_key_name

  # Security groups move onto the network interface when a public IP is requested,
  # as the two cannot be set at both levels of a launch template
  vpc_security_group_ids = var.require_public_ip ? null : var.security_group_ids

  dynamic "network_interfaces" {
    for_each = var.require_public_ip ? [1] : []
    content {
      device_index                = 0
      associate_public_ip_address = true
      delete_on_termination       = true
      security_groups             = var.security_group_ids
    }
  }

  iam_instance_profile {
    name = var.iam_profile_id
  }

  capacity_reservation_specification {
    capacity_reservation_preference = "none"
  }

  credit_specification {
    cpu_credits = "unlimited"
  }

  monitoring {
    enabled = true
  }

  user_data = var.user_data_script

  lifecycle {
    create_before_destroy = true
    ignore_changes        = [block_device_mappings]
  }
}
