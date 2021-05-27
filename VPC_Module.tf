

module "rus-vpc" {
  source = "rayslan/vpc/aws"
  version = "1.0.6"

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

 

/*###########################################################################
###########################################################################

#-----------VPC-----------
output "vpc-info" {
    value = aws_vpc.my-vpc
}

#-----------Gateways-----------
output "igw-info" {
    value = aws_internet_gateway.igw
}
output "ngw-info" {
    value = aws_nat_gateway.ngw 
}

#-----------Route Tables-----------
output "private-route-table-info" {
    value = aws_route_table.my-private-route-table
}
output "public-route-table-info" {
    value = aws_route_table.my-public-route-table
}

#-----------Subnets-----------
output "private-subnet1-info" {
    value = aws_subnet.private-subnet1
}
output "private-subnet2-info" {
    value = aws_subnet.private-subnet2
}
output "private-subnet3-info" {
    value = aws_subnet.private-subnet3
}
output "public-subnet1-info" {
    value = aws_subnet.public-subnet1
}
output "public-subnet2-info" {
    value = aws_subnet.public-subnet2
}
output "public-subnet3-info" {
    value = aws_subnet.public-subnet3
}

###########################################################################
##########################################################################*/

}
output "name" {
  value = module.rus-vpc.vpc-info
}