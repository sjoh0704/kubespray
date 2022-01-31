variable "landing_ec2_subnet_id" {}

variable "landing_vpc_cidr_block"{}

data "aws_caller_identity" "current" {}

data "aws_vpc" "landing-vpc" {
  id = var.landing_vpc_id
}

data "aws_route_table" "landing_route_table" {
  subnet_id = var.landing_ec2_subnet_id
}


resource "aws_vpc_peering_connection" "landing-vpc-to-cluster-vpc" {

  vpc_id = data.aws_vpc.landing-vpc.id
  peer_owner_id = data.aws_caller_identity.current.account_id
  peer_vpc_id = module.aws-vpc.aws_vpc_id
  auto_accept = true
}


resource "aws_route" "peering-to-cluster-vpc-public" {
  
  count = length(module.aws-vpc.aws_route_table_public)
  route_table_id = element(module.aws-vpc.aws_route_table_public, count.index)
  destination_cidr_block = var.landing_vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.landing-vpc-to-cluster-vpc.id
}


resource "aws_route" "peering-to-cluster-vpc-private" {

  count = length(module.aws-vpc.aws_route_table_private)
  route_table_id = element(module.aws-vpc.aws_route_table_private, count.index)
  destination_cidr_block = var.landing_vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.landing-vpc-to-cluster-vpc.id
}


resource "aws_route" "peering-from-landing-vpc" {
  
  route_table_id = data.aws_route_table.landing_route_table.id
  destination_cidr_block = var.aws_vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.landing-vpc-to-cluster-vpc.id
}
