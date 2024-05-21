
resource "aws_launch_template" "linux_runner_launch_template" {
  name = "${var.runner_prefix}_launch_template"
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {

      volume_size = var.volume_size
      volume_type = var.volume_type
    }
  }


  image_id                             = var.ami_id
  instance_initiated_shutdown_behavior = "terminate"
  key_name                             = var.keypair
  update_default_version               = true
  monitoring {
    enabled = true
  }
  network_interfaces {
    associate_public_ip_address = true
    subnet_id                   = var.subnet_id
    security_groups             = [var.security_group_id]
  }
  placement {
    availability_zone = var.availability_zone
  }

  tag_specifications {
    resource_type = "instance"
    tags          = var.default_tags
  }
  user_data = data.cloudinit_config.circleci_linux_runner_user_data.rendered
}

