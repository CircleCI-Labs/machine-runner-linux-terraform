variable "aws_region" {
  description = "AWS region for testing"
  type        = string
  default     = "us-east-1"
}

variable "runner_prefix" {
  description = "Name prefix to be attached to resource names"
  type        = string
  default     = "circleci_linux_runner_test"
}

variable "asg_desired_capacity" {
  description = "Desired Capacity for the CircleCI Runner Autoscaling group"
  type        = number
  default     = 2
}

variable "asg_max_capacity" {
  description = "Max size for the CircleCI Runner Autoscaling group"
  type        = number
  default     = 3
}

variable "volume_size" {
  description = "EBS volume size"
  type        = string
  default     = "100"
}

variable "volume_type" {
  description = "EBS volume type"
  type        = string
  default     = "gp3"
}

variable "ami_id" {
  description = "AMI ID for testing"
  type        = string
  default     = "ami-04b70fa74e45c3917"
}

variable "availability_zone" {
  description = "AWS Availability Zone"
  type        = string
  default     = "us-east-1a"
}

variable "keypair" {
  description = "Keypair name"
  type        = string
  default     = "test-keypair"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "m5a.xlarge"
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
  default     = "subnet-12345678"
}

variable "security_group_id" {
  description = "Security Group ID"
  type        = string
  default     = "sg-12345678"
}

variable "runner_token_secret_name" {
  description = "Runner token secret name"
  type        = string
  default     = "test-runner-token"
}

variable "default_tags" {
  description = "Default tags"
  type        = map(string)
  default = {
    "Team"        = "circleci"
    "Environment" = "test"
    "iac"         = "true"
    "owner"       = "circleci"
  }
}
