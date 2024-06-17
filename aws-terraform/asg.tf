

resource "aws_autoscaling_group" "linux_runner_asg" {
  name                 = "${var.runner_prefix}_asg"
  availability_zones   = [var.availability_zone]
  desired_capacity     = var.asg_desired_capacity
  max_size             = 0
  min_size             = var.asg_max_capacity
  termination_policies = ["OldestInstance"]
  launch_template {
    id      = aws_launch_template.linux_runner_launch_template.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = var.runner_prefix
    propagate_at_launch = "true"
  }


  tag {
    key                 = "env"
    value               = "circleci"
    propagate_at_launch = "true"
  }

  dynamic "tag" {
    for_each = var.default_tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}
