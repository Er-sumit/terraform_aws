To automate this process using Terraform and GitHub Actions, you can follow these steps:

### Step 1: Create Terraform Configuration

Create a Terraform configuration file (`main.tf`) to manage the AWS IAM roles. Here’s an example of how you can create service-linked roles for Elastic Load Balancing and ECS:

```hcl
provider "aws" {
  region = "us-west-2"  # Change this to your preferred region
}

resource "aws_iam_service_linked_role" "elb_service_role" {
  aws_service_name = "elasticloadbalancing.amazonaws.com"
}

resource "aws_iam_service_linked_role" "ecs_service_role" {
  aws_service_name = "ecs.amazonaws.com"
}
```

### Step 2: Create GitHub Actions Workflow

Create a GitHub Actions workflow file (`.github/workflows/deploy.yml`) to run the Terraform configuration. Here’s an example workflow:

```yaml
name: Deploy to AWS

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v1
        with:
          terraform_version: 1.0.0  # Change this to your preferred Terraform version

      - name: Initialize Terraform
        run: terraform init

      - name: Validate Terraform
        run: terraform validate

      - name: Apply Terraform
        run: terraform apply -auto-approve
        env:
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
```

### Step 3: Configure GitHub Secrets

Make sure you store your AWS credentials as secrets in your GitHub repository:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

### Summary

- Create a Terraform configuration file to define the service-linked roles.
- Create a GitHub Actions workflow to initialize, validate, and apply the Terraform configuration.
- Store your AWS credentials as GitHub secrets.

With these steps, the roles will be created or updated every time you push changes to the `main` branch in your GitHub repository. If you need any further assistance, feel free to ask!