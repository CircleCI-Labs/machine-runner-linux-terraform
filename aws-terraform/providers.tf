terraform {
  backend "s3" {
    bucket = "fieldeng-aws-tf-state-machine-linux-terraform"
    key    = "fieldeng-aws-tf-state-aws"
    region = "us-east-1"

    assume_role = {
      role_arn = "arn:aws:iam::992382483259:role/fieldeng_aws_ci_oidc_role"
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
    role_arn     = "arn:aws:iam::992382483259:role/fieldeng_aws_ci_oidc_role"
    session_name = "fieldeng_aws_oidc_standalone_terraform"
  }
  region = var.aws_region

  default_tags {
    tags = var.fieldeng_tags
  }
}
