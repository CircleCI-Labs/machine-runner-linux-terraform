
####  Instructions for setting up this Repo in your own Github + CircleCI account

- Step 1: [Configure this project to use OIDC tokens](https://circleci.com/docs/openid-connect-tokens/) to access AWS without long-lived credentials being stored in CircleCI. Once you have a role configured, you can update the config.yml [here](https://github.com/CircleCI-Labs/machine-runner-linux-terraform/blob/1f2d63065ab7e284da096eee0b669dc61223f1b7/.circleci/config.yml#L26)
- Step 2: Setup your `terraform.tfvars` file (template provided [here](https://github.com/CircleCI-Labs/machine-runner-linux-terraform/blob/main/terraform.tfvars.template))
```
subnet_id="subnet-id"
security_group_id="sg-abcd12345"
keypair="<keypair-name-goes-here>"
runner_token_secret_name="arn:aws:secretsmanager:<region>:<account-id>:secret:<secret-name-where-runner-token-is-stored>"
```
- Step 3: Update the [`providers.tf`](https://github.com/CircleCI-Labs/machine-runner-linux-terraform/blob/main/aws-terraform/providers.tf#L1-L6) with your account specific attributes - namely the role for Terraform to assume.
- Step 4: Update the [`versions.tf`](https://github.com/CircleCI-Labs/machine-runner-linux-terraform/blob/main/aws-terraform/versions.tf#L2-L6) with your account specific attributes - namely the Terraform state bucket and the region