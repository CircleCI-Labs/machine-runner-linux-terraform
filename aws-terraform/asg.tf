terraform {
  backend "s3" {
    bucket = "circleci-labs-machine-runner-tf-state"
    key    = "circleci-runner-aws.tfstate"
    region = "us-east-1"
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
  # Configuration options
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region

  default_tags {
    tags = var.default_tags
  }
}
