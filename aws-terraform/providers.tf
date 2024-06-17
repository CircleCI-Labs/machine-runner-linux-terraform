provider "aws" {
  assume_role {
    role_arn     = var.tf_role_arn
    session_name = "<session-name-for-terraform>"
  }
  region = var.aws_region
}