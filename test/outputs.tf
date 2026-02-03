output "autoscaling_group_name" {
  description = "The name of the CircleCI runner autoscaling group"
  value       = module.circleci_runner_asg_test.autoscaling_group_name
}

output "launch_template_id" {
  description = "The ID of the launch template"
  value       = module.circleci_runner_asg_test.launch_template_id
}
