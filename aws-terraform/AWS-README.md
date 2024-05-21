
#### Instructions for setting up this Repo in your own Github + CircleCI account 

- Step 1: Set defaults in your `variables.tf`
- Step 2: Setup your `terraform.tfvars` file

```
aws_access_key="<aws-access-key-goes-here>"
aws_secret_key="<aws-secret-key-goes-here>"
subnet_id="subnet-id"
security_group_id="sg-abcd12345"
keypair="<keypair-name-goes-here>"
runner_token_secret_name="arn:aws:secretsmanager:<region>:<account-id>:secret:<secret-name-where-runner-token-is-stored>"
```

- Step 3: Update the [`providers.tf`](https://github.com/CircleCI-Labs/machine-runner-linux-terraform/blob/main/aws-terraform/providers.tf#L1-L6) with your account specific attributes - namely the Terraform state bucket and the region

- Step 4: You can use the CircleCI [config.yml](https://github.com/CircleCI-Labs/machine-runner-linux-terraform/blob/main/.circleci/config.yml) to set the following environment variables (either in a project environment variable or context)
   - `$TF_S3_BUCKET` (bucket where terraform.tfvars with secrets is stored)
   - `$AWS_ACCESS_KEY_ID` - Credentials for running Terraform
   - `$AWS_SECRET_ACCESS_KEY` - Credentials for running Terraform
