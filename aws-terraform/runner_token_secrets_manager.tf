data "aws_secretsmanager_secret" "cci_linux_runner_token_secret" {
  name = var.runner_token_secret_name
}

data "aws_secretsmanager_secret_version" "cci_linux_runner_token_secret_version" {
  secret_id = data.aws_secretsmanager_secret.cci_linux_runner_token_secret.id
}