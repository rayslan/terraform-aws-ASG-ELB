# provider "aws" {
#   region = "ca-central-1"
# }


module "rus-vpc" {
  source = "rayslan/vpc/aws"
  version = "1.0.5"

  tag-vpc-name     = "vpc1"
  region           = "ca-central-1"
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default" # Choose one

  cidr-block-private-subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"] #Creates 3 private subnets ( you can not change the number )
  cidr-block-public-subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"] #Creates 3 public subnets ( you can not change the number )

  private-subnet-names = ["private1", "private2", "private3"]
  public-subnet-names  = ["public1", "public2", "public3"]

  private-route-table-name = "private"
  public-route-table-name  = "public"

  igw-name = "igw-rus"
  ngw-name = "ngw-rus"

#----------Outputs---------#

 /* output "vpc-info" {
    value = aws_vpc.my-vpc
}*/

}
#  resource "aws_subnet" "private-subnet10" {
#   vpc_id     = module.rus-vpc.vpc-info.id 
#   cidr_block = "10.0.4.0/24" #This goes to module
  
#   tags = {
#       Name = "russ" #This goes to module
#   }
# }