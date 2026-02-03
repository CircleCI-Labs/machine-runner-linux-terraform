output "autoscaling_group_name" {
  description = "The name of the CircleCI runner autoscaling group"
  value       = module.circleci_runner_asg.autoscaling_group_name
}

output "autoscaling_group_arn" {
  description = "The ARN of the CircleCI runner autoscaling group"
  value       = module.circleci_runner_asg.autoscaling_group_arn
}

output "launch_template_id" {
  description = "The ID of the launch template used for CircleCI runners"
  value       = module.circleci_runner_asg.launch_template_id
}

output "launch_template_latest_version" {
  description = "The latest version of the launch template"
  value       = module.circleci_runner_asg.launch_template_latest_version
}

output "scaling_policy_name" {
  description = "The name of the predictive scaling policy"
  value       = module.circleci_runner_asg.scaling_policy_name
}
