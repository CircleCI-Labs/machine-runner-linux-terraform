variable "aws_region" {
  description = "AWS region where resources will be created. Must match where your Secrets Manager secret and VPC resources exist."
  type        = string
  default     = "us-east-1"
}

variable "runner_prefix" {
  description = "Name prefix to be attached to resource names"
  type        = string
  default     = "circleci_linux_runner"
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
  description = "EBS volume size in GB"
  type        = string
  default     = "100"
}

variable "volume_type" {
  description = "EBS volume type"
  type        = string
  default     = "gp3"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances. Default is Ubuntu 24.04 LTS in us-east-1"
  type        = string
  default     = "ami-04b70fa74e45c3917"
}

variable "availability_zone" {
  description = "AWS Availability Zone where runners will be placed"
  type        = string
  default     = "us-east-1a"
}

variable "keypair" {
  description = "Keypair to be associated with the EC2 instances"
  type        = string
}

variable "iam_instance_profile" {
  description = "Optional name or ARN of an existing IAM instance profile to attach to runner EC2 instances. Leave unset to launch without an instance profile."
  type        = string
  default     = null
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "m5a.xlarge"
}

variable "subnet_id" {
  description = "Subnet where CircleCI runner EC2 instances should be created"
  type        = string
}

variable "security_group_id" {
  description = "Security Group for Runners"
  type        = string
}

variable "runner_token_secret_name" {
  description = "Name of the AWS Secrets Manager Secret where the runner token is stored"
  type        = string
}

variable "server" {
  description = "When true, write server_url under api in the CircleCI runner config. When false, do not add a server URL."
  type        = bool
  default     = false
}

variable "server_url" {
  description = "CircleCI Server URL used when server is true. Example: https://circleci.example.com."
  type        = string
  default     = ""
}

variable "default_tags" {
  description = "Default tags to apply to all resources"
  type        = map(string)
  default = {
    "Team"  = "circleci"
    "iac"   = "true"
    "owner" = "circleci"
  }
}
