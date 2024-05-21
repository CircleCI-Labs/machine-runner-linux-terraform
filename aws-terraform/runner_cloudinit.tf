

data "cloudinit_config" "circleci_linux_runner_user_data" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/x-shellscript"
    content = templatefile(
      "${path.module}/templates/setup-circleci-runner.sh.tpl",
      {
        cci_runner_token = jsondecode(data.aws_secretsmanager_secret_version.cci_linux_runner_token_secret_version.secret_string)["circleci_runner_token"]
      }
    )
  }
}
