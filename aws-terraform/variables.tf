
variable "aws_region" {
  default = "us-east-1"
}

variable "runner_prefix" {
  description = "Name prefix to be attached to resource names"
  default     = "circleci_linux_runner"
}

variable "volume_size" {
  default = "30"
}

variable "volume_type" {
  default = "gp3"
}

variable "ami_id" {
  default     = "ami-04b70fa74e45c3917"
  description = "Canonical, Ubuntu, 24.04 LTS, amd64 noble image build on 2024-04-23"
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
  default     = "sg-123456"
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

