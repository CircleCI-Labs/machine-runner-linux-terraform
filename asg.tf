
locals {
  asg_predictive_scaling_policy_name = "cci_linux_runner_predictive_scaling_policy"
  runner_prefix = "circleci_linux_runner
}

resource "aws_autoscaling_group" "linux_runner_asg" {
  name                 = "${local.runner_prefix}_asg"
  availability_zones   = ["us-east-1a"]
  desired_capacity     = 0
  max_size             = 0
  min_size             = 0
  termination_policies = ["OldestInstance"]
  launch_template {
    id      = aws_launch_template.linux_runner_launch_template.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = local.runner_prefix
    propagate_at_launch = "true"
  }


  tag {
    key                 = "env"
    value               = "circleci"
    propagate_at_launch = "true"
  }

  dynamic "tag" {
    for_each = var.fieldeng_tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}

