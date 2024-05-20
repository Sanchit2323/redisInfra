# association private subnets with private route tables 

resource "aws_route_table_association" "deploy_private1_subnet_association" {
  subnet_id      = aws_subnet.deploy_subnet_private1.id
  route_table_id = aws_route_table.deploy_private1_route.id
}

resource "aws_route_table_association" "deploy_private2_subnet_association" {
  subnet_id      = aws_subnet.deploy_subnet_private2.id
  route_table_id = aws_route_table.deploy_private2_route.id
}

# route table association for public subnet to public route table

resource "aws_route_table_association" "deploy_public_subnet_association" {
  subnet_id      = aws_subnet.deploy_subnet_public.id
  route_table_id = aws_route_table.deploy_public_route.id
}

resource "aws_route_table_association" "deploy_public_subnet_association2" {
  subnet_id      = aws_subnet.deploy_subnet_public2.id
  route_table_id = aws_route_table.deploy_public_route.id
}


# route table association for default subnet to default route table


# resource "aws_route_table_association" "default_subnet_association" {
#   subnet_id      = data.aws_subnet.selected.id
#   route_table_id = "rtb-0d99410576d474cb2"
# }
