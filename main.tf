provider "aws" {
  region = "ap-south-1"  # Change this to your preferred region
}
#---------------------------------------------------------------------------#
# Commenting below code as It was written undocumented and hence lost track
# Any new code will be taken to individual .tf files
#---------------------------------------------------------------------------#
# # Check if the ELB service-linked role exists
# data "aws_iam_role" "elb_service_role" {
#   name = "AWSServiceRoleForElasticLoadBalancing"
# }
# 
# # Create the ELB service-linked role if it does not exist
# resource "aws_iam_service_linked_role" "elb_service_role" {
#   aws_service_name = "elasticloadbalancing.amazonaws.com"
# 
#   lifecycle {
#     ignore_changes = [name]
#   }
# 
#   count = length(data.aws_iam_role.elb_service_role.name) == 0 ? 1 : 0
# }
# 
# # Check if the ECS service-linked role exists
# data "aws_iam_role" "ecs_service_role" {
#   name = "AWSServiceRoleForECS"
# }
# 
# # Create the ECS service-linked role if it does not exist
# resource "aws_iam_service_linked_role" "ecs_service_role" {
#   aws_service_name = "ecs.amazonaws.com"
# 
#   lifecycle {
#     ignore_changes = [name]
#   }
# 
#   count = length(data.aws_iam_role.ecs_service_role.name) == 0 ? 1 : 0
# }
