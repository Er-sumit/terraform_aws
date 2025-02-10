provider "aws" {
  region = "ap-south-1"  # Change this to your preferred region
}

resource "aws_iam_service_linked_role" "elb_service_role" {
  aws_service_name = "elasticloadbalancing.amazonaws.com"
}

resource "aws_iam_service_linked_role" "ecs_service_role" {
  aws_service_name = "ecs.amazonaws.com"
}
