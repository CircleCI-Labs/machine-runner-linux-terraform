variable "runner_prefix" {
  description = "Name prefix to be attached to resource names"
  default     = "circleci_linux_runner"
}

variable "asg_desired_capacity" {
  description = "Desired Capacity for the CircleCI Runner Autoscaling group"
  type        = number
}

variable "asg_max_capacity" {
  description = "Max size for the CircleCI Runner Autoscaling group"
  type        = number
}

variable "volume_size" {
  default = "100"
}

variable "volume_type" {
  default = "gp3"
}

variable "ami_id" {
  default     = "ami-003a4b9e4d6e86322"
  description = "ubuntu-noble-24.04-amd64-server"
}

variable "availability_zone" {
  default     = "us-east-1a"
  description = "AWS Availability Region where runners will be placed"
}

variable "keypair" {
  description = "Keypair to be associated with the EC2 instances"
}

variable "instance_type" {
  default = "m5a.xlarge"
}

variable "subnet_id" {
  description = "Subnet where CircleCI runner EC2 instances should be created"
}

variable "security_group_id" {
  description = "Security Group for Runners"
}

variable "runner_token_secret_name" {
  description = "Name of the AWS Secrets Manager Secret where the runner token is stored"
}

variable "default_tags" {
  type = map(string)
  default = {
    "Team"                = "circleci"
    "iac"                 = "true"
    "owner"               = "circleci"
  }
}

