# configuring public route table

resource "aws_route_table" "deploy_public_route" {
  vpc_id = aws_vpc.deploy_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.deploy_igw.id
  }

  tags = {
    Name = "public-route"
  }

}

#  configuring route table for private1 subnets

resource "aws_route_table" "deploy_private1_route" {
  vpc_id = aws_vpc.deploy_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.deploy_nat_gateway.id
  }
  tags = {
    Name = "private1-route"
  }

}

# private2 route table

resource "aws_route_table" "deploy_private2_route" {
  vpc_id = aws_vpc.deploy_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.deploy_nat_gateway.id
  }
  tags = {
    Name = "private2-route"
  }

}