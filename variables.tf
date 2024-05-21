
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

variable "keypair" {
  description = "Keypair to be associated with the EC2 instances"
}

variable "instance_type" {
  default = "m5a.large"
}

variable "subnet_id" {
  description = "Subnet where CircleCI runner EC2 instances should be created"
}

variable "security_group_id" {
  description = "Security Group for Runners"
}
