terraform {
  backend "s3" {
    bucket = "fieldeng-aws-tf-state-machine-linux-terraform"
    key    = "fieldeng-aws-tf-state-aws"
    region = "us-east-1"

    assume_role = {
      role_arn = var.tf_role_arn
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.47.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.1"
    }
  }
}

provider "aws" {
  assume_role {
    role_arn     = var.tf_role_arn
    session_name = "fieldeng_aws_oidc_standalone_terraform"
  }
  region = var.aws_region

  default_tags {
    tags = var.default_tags
  }
}
