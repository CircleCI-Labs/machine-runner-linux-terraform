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
  default     = "ami-00032c95c343f8efb"
  description = "Canonical, Ubuntu, 25.04, amd64 plucky image"
}

variable "availability_zone" {
  default     = "us-east-1a"
  description = "AWS Availability Region where runners will be placed"
}

variable "keypair" {
  description = "Keypair to be associated with the EC2 instances"
}

variable "iam_instance_profile" {
  description = "Optional name or ARN of an existing IAM instance profile to attach to runner EC2 instances. Accepts an instance profile name or an instance-profile ARN (arn:aws:iam::ACCOUNT_ID:instance-profile/NAME). Leave unset to launch without an instance profile. This does not create an IAM role or instance profile."
  type        = string
  default     = null

  validation {
    condition = (
      (var.iam_instance_profile == null ? "" : trimspace(var.iam_instance_profile)) == "" ||
      !startswith(var.iam_instance_profile == null ? "" : trimspace(var.iam_instance_profile), "arn:") ||
      can(regex("^arn:[^:]+:iam::[0-9]{12}:instance-profile/.+", var.iam_instance_profile == null ? "" : trimspace(var.iam_instance_profile)))
    )
    error_message = "iam_instance_profile must be an IAM instance profile name or an instance-profile ARN (arn:PARTITION:iam::ACCOUNT_ID:instance-profile/NAME), not an IAM role ARN."
  }
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

variable "server" {
  description = "When true, write server_url under api in the CircleCI runner config so instances register with CircleCI Server. When false (the default), the url line is omitted and cloud runner behavior is unchanged."
  type        = bool
  default     = false
}

variable "server_url" {
  description = "CircleCI Server base URL written as api.url when server is true. Example: https://circleci.example.com. Ignored when server is false."
  type        = string
  default     = ""

  validation {
    condition     = var.server == false || try(trimspace(var.server_url), "") != ""
    error_message = "server_url must be a non-empty CircleCI Server URL (for example https://circleci.example.com) when server is true."
  }
}

variable "default_tags" {
  type = map(string)
  default = {
    "Team"  = "circleci"
    "iac"   = "true"
    "owner" = "circleci"
  }
}

