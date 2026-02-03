provider "aws" {
  region = var.aws_region
}

# This test configuration validates the module can be planned successfully
module "circleci_runner_asg_test" {
  source = "../aws-terraform"

  # Required variables
  asg_desired_capacity     = var.asg_desired_capacity
  asg_max_capacity         = var.asg_max_capacity
  keypair                  = var.keypair
  subnet_id                = var.subnet_id
  security_group_id        = var.security_group_id
  runner_token_secret_name = var.runner_token_secret_name

  # Optional variables
  runner_prefix     = var.runner_prefix
  instance_type     = var.instance_type
  availability_zone = var.availability_zone
  ami_id            = var.ami_id
  volume_size       = var.volume_size
  volume_type       = var.volume_type
  default_tags      = var.default_tags
}
