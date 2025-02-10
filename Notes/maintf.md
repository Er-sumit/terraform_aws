The error indicates that the IAM service-linked role `AWSServiceRoleForECS` already exists in your account. To handle this situation in Terraform, you can use a `data` block to check if the role already exists and then create it only if it does not.

Here's how you can update your Terraform code to handle this scenario:

### Updated Terraform Configuration (`main.tf`)

```hcl
provider "aws" {
  region = "ap-south-1"  # Change this to your preferred region
}

# Check if the ELB service-linked role exists
data "aws_iam_role" "elb_service_role" {
  name = "AWSServiceRoleForElasticLoadBalancing"
}

# Create the ELB service-linked role if it does not exist
resource "aws_iam_service_linked_role" "elb_service_role" {
  aws_service_name = "elasticloadbalancing.amazonaws.com"

  lifecycle {
    ignore_changes = [name]
  }

  count = length(data.aws_iam_role.elb_service_role.name) == 0 ? 1 : 0
}

# Check if the ECS service-linked role exists
data "aws_iam_role" "ecs_service_role" {
  name = "AWSServiceRoleForECS"
}

# Create the ECS service-linked role if it does not exist
resource "aws_iam_service_linked_role" "ecs_service_role" {
  aws_service_name = "ecs.amazonaws.com"

  lifecycle {
    ignore_changes = [name]
  }

  count = length(data.aws_iam_role.ecs_service_role.name) == 0 ? 1 : 0
}
```

### Explanation:

1. **Data Block**: The `data` block is used to check if the service-linked role already exists in your account.
2. **Conditional Resource Creation**: The `count` attribute is used to conditionally create the service-linked role only if it does not already exist.
   - `count = length(data.aws_iam_role.elb_service_role.name) == 0 ? 1 : 0` ensures that the `elb_service_role` is created only if it does not already exist.
   - `count = length(data.aws_iam_role.ecs_service_role.name) == 0 ? 1 : 0` ensures that the `ecs_service_role` is created only if it does not already exist.

This approach will prevent Terraform from attempting to create a service-linked role that already exists in your account.

Feel free to reach out if you have any further questions or need additional assistance!