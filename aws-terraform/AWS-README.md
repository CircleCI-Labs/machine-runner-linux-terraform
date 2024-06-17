
#### Instructions for setting up this Repo in your own Github + CircleCI account 

- Step 1: Ensure that the CircleCI OIDC is setup correctly in AWS
- Step 2: Setup your `terraform.tfvars` file (template provided here)

```
subnet_id="subnet-id"
security_group_id="sg-abcd12345"
keypair="<keypair-name-goes-here>"
runner_token_secret_name="arn:aws:secretsmanager:<region>:<account-id>:secret:<secret-name-where-runner-token-is-stored>"
```

- Step 3: Update the [`providers.tf`](https://github.com/CircleCI-Labs/machine-runner-linux-terraform/blob/main/aws-terraform/providers.tf#L1-L6) with your account specific attributes - namely the Terraform state bucket and the region


