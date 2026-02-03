# Configure the AWS provider with your desired region
provider "aws" {
  region = var.aws_region
}

# Optional: Configure Terraform backend
# terraform {
#   backend "s3" {
#     bucket = "my-terraform-state-bucket"
#     key    = "circleci-runners/terraform.tfstate"
#     region = "us-east-1"
#   }
# }

module "circleci_runner_asg" {
  source = "git::https://github.com/CircleCI-Labs/machine-runner-linux-terraform.git//aws-terraform?ref=main"

  # Required variables
  asg_desired_capacity     = var.asg_desired_capacity
  asg_max_capacity         = var.asg_max_capacity
  keypair                  = var.keypair
  subnet_id                = var.subnet_id
  security_group_id        = var.security_group_id
  runner_token_secret_name = var.runner_token_secret_name

  # Optional variables with custom values
  runner_prefix     = var.runner_prefix
  availability_zone = var.availability_zone
  instance_type     = var.instance_type
  ami_id            = var.ami_id
  volume_size       = var.volume_size
  volume_type       = var.volume_type

  # Custom tags
  default_tags = var.default_tags
}
