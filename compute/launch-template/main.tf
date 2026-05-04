# -----------------------------------------------------------------------------
# Launch template
# -----------------------------------------------------------------------------

resource "aws_launch_template" "this" {
  name_prefix                          = "${var.name}-"
  image_id                             = var.image_id
  instance_type                        = var.ec2_instance_type
  disable_api_termination              = var.disable_api_termination
  ebs_optimized                        = true
  instance_initiated_shutdown_behavior = "stop"
  key_name                             = var.ssh_key_name
  vpc_security_group_ids               = ["${var.security_group_ids}"]

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
  }
}
