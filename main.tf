provider "aws" {
  region = "ap-south-1"
}

terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}
# vpc
resource "aws_vpc" "deploy_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "deploy"
  }
}

# internet gateway

resource "aws_internet_gateway" "deploy_igw" {
  vpc_id = aws_vpc.deploy_vpc.id

  tags = {
    Name = "deploy-igw"
  }
}

# elastic ip address

resource "aws_eip" "deploy_elasticip" {
  domain = "vpc"
  tags = {
    Name = "deploy-elasticip"
  }
}

# nat gateway

resource "aws_nat_gateway" "deploy_nat_gateway" {
  allocation_id = aws_eip.deploy_elasticip.id
  subnet_id     = aws_subnet.deploy_subnet_public.id

  tags = {
    Name = "deploy-nat-gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPCaws_internet_gateway.
  depends_on = [aws_internet_gateway.deploy_igw]
}


# data block for already created vpc

data "aws_vpc" "selected" {
  id = "vpc-0e9baaca3c4ad778e"
}

# data "aws_subnet" "selected" {
#   id = "subnet-077dbcd0842c059e1"
# }







