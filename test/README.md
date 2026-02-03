# Test Configuration

This directory contains a test configuration used by CI/CD to validate that the Terraform module can be successfully planned.

## Purpose

This test:
- Validates the module syntax and structure
- Ensures all required variables are properly defined
- Confirms outputs are correctly exposed
- Verifies the module can be instantiated correctly

## CI Integration

The `.circleci/config.yml` includes two types of validation jobs:

### 1. `tf-module-plan` (runs automatically)
This job runs on every commit and does:
- `terraform init` - Downloads the module and providers
- `terraform validate` - Validates syntax and structure
- `terraform fmt -check` - Ensures code is properly formatted
- **Does not require AWS credentials**
- Fast validation of module structure

### 2. `tf-module-plan-with-aws` (optional, requires AWS resources)
This job can be added to workflows when you want to test with real AWS:
- Uses OIDC authentication
- Runs `terraform plan` against real AWS API
- **Requires** these resources to exist:
  - Secrets Manager secret named `test-runner-token`
  - VPC with subnet `subnet-12345678`
  - Security group `sg-12345678`
  - EC2 keypair `test-keypair`

To use this job, add it to the workflow in `.circleci/config.yml`:
```yaml
workflows:
  tf-validate:
    jobs:
      - tf-validate
      - tf-module-plan
      - tf-module-plan-with-aws  # Add this line
```

## Local Usage

### Validation Only (no AWS credentials needed):
```bash
cd test
terraform init
terraform validate
```

### Full Plan (requires AWS credentials):
```bash
cd test
terraform init
terraform plan
```

**Note:** This uses dummy/example values for AWS resources. For local planning, you may need to override variables with real resource IDs:

```bash
terraform plan \
  -var="subnet_id=subnet-real123" \
  -var="security_group_id=sg-real456" \
  -var="runner_token_secret_name=your-real-secret"
```

**Warning:** Never apply this test configuration. It is for validation only.
