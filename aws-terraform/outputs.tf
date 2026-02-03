output "autoscaling_group_id" {
  description = "The ID of the CircleCI runner autoscaling group"
  value       = aws_autoscaling_group.linux_runner_asg.id
}

output "autoscaling_group_name" {
  description = "The name of the CircleCI runner autoscaling group"
  value       = aws_autoscaling_group.linux_runner_asg.name
}

output "autoscaling_group_arn" {
  description = "The ARN of the CircleCI runner autoscaling group"
  value       = aws_autoscaling_group.linux_runner_asg.arn
}

output "launch_template_id" {
  description = "The ID of the launch template used for CircleCI runners"
  value       = aws_launch_template.linux_runner_launch_template.id
}

output "launch_template_arn" {
  description = "The ARN of the launch template used for CircleCI runners"
  value       = aws_launch_template.linux_runner_launch_template.arn
}

output "launch_template_latest_version" {
  description = "The latest version of the launch template"
  value       = aws_launch_template.linux_runner_launch_template.latest_version
}

output "scaling_policy_name" {
  description = "The name of the predictive scaling policy"
  value       = aws_autoscaling_policy.asg_predictive_scaling_policy.name
}

output "scaling_policy_arn" {
  description = "The ARN of the predictive scaling policy"
  value       = aws_autoscaling_policy.asg_predictive_scaling_policy.arn
}
