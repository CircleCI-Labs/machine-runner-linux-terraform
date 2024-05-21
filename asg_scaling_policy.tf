locals {
  asg_predictive_scaling_policy_name = "circleci_linux_runner_predictive_scaling_policy"
}


resource "aws_autoscaling_policy" "asg_predictive_scaling_policy" {
  autoscaling_group_name = aws_autoscaling_group.linux_runner_asg.name
  name                   = local.asg_predictive_scaling_policy_name
  policy_type            = "PredictiveScaling"
  predictive_scaling_configuration {
    metric_specification {
      target_value = 80
      predefined_load_metric_specification {
        predefined_metric_type = "ASGTotalCPUUtilization"
      }
      customized_scaling_metric_specification {
        metric_data_queries {
          id = "scaling"
          metric_stat {
            metric {
              metric_name = "CPUUtilization"
              namespace   = "AWS/EC2"
              dimensions {
                name  = "AutoScalingGroupName"
                value = local.asg_predictive_scaling_policy_name
              }
            }
            stat = "Average"
          }
        }
      }
    }
  }
}
