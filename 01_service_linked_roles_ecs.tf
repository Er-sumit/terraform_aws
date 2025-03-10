
# Service-Linked Role for Elastic Load Balancing
resource "aws_iam_service_linked_role" "elb" {
  aws_service_name = "elasticloadbalancing.amazonaws.com"
}

# Service-Linked Role for ECS
# resource "aws_iam_service_linked_role" "ecs" {
#   aws_service_name = "ecs.amazonaws.com"
# }
#  - Do NOT directly create this role, first check if this exists and create only if it doesn't
# Check if the service-linked role for ECS already exists
data "aws_iam_role" "ecs" {
  name = "AWSServiceRoleForECS"
}

# Create the service-linked role for ECS only if it doesn't exist
resource "aws_iam_service_linked_role" "ecs" {
  aws_service_name = "ecs.amazonaws.com"

  # Create only if the role is not found
  count = length(data.aws_iam_role.ecs.arn) > 0 ? 0 : 1
}