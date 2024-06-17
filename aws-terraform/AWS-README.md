
####  Instructions for setting up this Repo in your own Github + CircleCI account

- Step 1: [Configure this project to use OIDC tokens](https://circleci.com/docs/openid-connect-tokens/) to access AWS without long-lived credentials being stored in CircleCI. Once you have a role configured, you can update the config.yml [here](https://github.com/CircleCI-Labs/machine-runner-linux-terraform/blob/1f2d63065ab7e284da096eee0b669dc61223f1b7/.circleci/config.yml#L26)

- Step 2: Once you have the OIDC role, then you can reference the Terraform template in the format below and run `terraform plan` and `terraform apply`

```
  module "my-aws-runner-asg" {
  source                    = "git::https://github.com/CircleCI-Labs/machine-runner-linux-terraform.git//aws-terraform?ref=main"
  asg_desired_capacity      = 2
  asg_max_capacity          = 3
  keypair                   = "circleci-default-keypair"
  subnet_id                 = "subnet-123456789"
  security_group_id         = "sg-abcd1234"
  runner_token_secret_name  = "awesomecicd-standalone-secrets"
}

provider "aws" {
  assume_role {
    role_arn     = "arn:aws:iam::123456789012:role/circleci_aws_oidc_role"
    session_name = "machine-runner-linux-tf"
  }
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket   = "circleci-aws-tf-state"
    key      = "machine-runner-linux-tf-tests.tfstate"
    region   = "us-east-1"
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

```
