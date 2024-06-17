terraform {
  backend "s3" {
    bucket   = "<tf-state-bucket-name-goes-here>"
    key      = "<tf-state-filename>.tfstate"
    region   = "us-east-1"
    role_arn = "<role-arn-name-for-terraform-to-assume"
  }
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.4.0"
    }
    cloudinit = {
      version = ">=2.0"
      source  = "hashicorp/cloudinit"
    }
  }
}