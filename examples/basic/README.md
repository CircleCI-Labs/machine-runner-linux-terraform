# Basic Example

This example demonstrates how to use the CircleCI Machine Runner Terraform module to deploy a basic autoscaling group of self-hosted Linux runners in AWS.

## Prerequisites

1. AWS account with appropriate permissions
2. Terraform >= 1.5.0 installed
3. CircleCI runner token stored in AWS Secrets Manager in your target region
4. Existing VPC with subnet and security group in your target region
5. EC2 keypair created in your target region

**Important:** All resources (Secrets Manager secret, VPC, subnet, security group, keypair) must exist in the same AWS region that you configure in the provider block.

## Usage

1. Copy the `terraform.tfvars.example` file to `terraform.tfvars`:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

2. Edit `terraform.tfvars` and update the required values:
   - `subnet_id`: Your VPC subnet ID
   - `security_group_id`: Your security group ID
   - `keypair`: Your EC2 keypair name
   - `runner_token_secret_name`: Name of your AWS Secrets Manager secret containing the CircleCI runner token

3. Initialize Terraform:
   ```bash
   terraform init
   ```

4. Review the plan:
   ```bash
   terraform plan
   ```

5. Apply the configuration:
   ```bash
   terraform apply
   ```

## Required Secrets Manager Setup

Your AWS Secrets Manager secret should contain a JSON object with the following structure:

```json
{
  "circleci_runner_token": "your-runner-token-from-circleci"
}
```

To create the secret:

```bash
aws secretsmanager create-secret \
  --name your-runner-token-secret \
  --secret-string '{"circleci_runner_token":"your-token-here"}'
```

## Customization

You can customize the deployment by modifying variables in `terraform.tfvars`:

- **Scaling**: Adjust `asg_desired_capacity` and `asg_max_capacity`
- **Instance Type**: Change `instance_type` for different compute requirements
- **Storage**: Modify `volume_size` and `volume_type`
- **AMI**: Update `ami_id` to use a different base image
- **Tags**: Customize `default_tags` for your organization's tagging strategy

## Outputs

After deployment, the following information will be available:

- `autoscaling_group_name`: Name of the ASG
- `autoscaling_group_arn`: ARN of the ASG
- `launch_template_id`: ID of the launch template
- `launch_template_latest_version`: Current version of the launch template
- `scaling_policy_name`: Name of the predictive scaling policy

## Clean Up

To destroy the resources:

```bash
terraform destroy
```
