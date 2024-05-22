# creating vpc peering conenction 

resource "aws_vpc_peering_connection" "deploy_vpc_peering" {
  #  owner account id
  peer_owner_id = "590183719329"
  #   vpc id of another vpc , acceptor
  peer_vpc_id = "vpc-0e9baaca3c4ad778e"
  #   requester
  vpc_id      = aws_vpc.deploy_vpc.id
  auto_accept = true

  tags = {
    Name = "deploy-peering"
  }
}

# adding peering connection to public 

resource "aws_route" "deploy_peering_public" {
  route_table_id            = aws_route_table.deploy_public_route.id
  destination_cidr_block    = "172.31.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.deploy_vpc_peering.id
}


#  peering connection for private1 subnets

resource "aws_route" "deploy_peering_private1" {
  route_table_id            = aws_route_table.deploy_private1_route.id
  destination_cidr_block    = "172.31.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.deploy_vpc_peering.id
}

# peering connection for private2 subnet

resource "aws_route" "deploy_peering_private2" {
  route_table_id            = aws_route_table.deploy_private2_route.id
  destination_cidr_block    = "172.31.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.deploy_vpc_peering.id
}

# adding peering to default vpc route table

resource "aws_route" "deploy_peering_default" {
  route_table_id            = "rtb-022cf288338435dd4"
  destination_cidr_block    = "10.0.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.deploy_vpc_peering.id
}
