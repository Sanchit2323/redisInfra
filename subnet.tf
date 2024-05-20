# public subnet

resource "aws_subnet" "deploy_subnet_public" {
  vpc_id     = aws_vpc.deploy_vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "public"
  }

  availability_zone = "ap-south-1a"

  map_public_ip_on_launch = true
}

resource "aws_subnet" "deploy_subnet_public2" {
  vpc_id     = aws_vpc.deploy_vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "public2-subnet"
  }

  availability_zone = "ap-south-1b"

  map_public_ip_on_launch = true
}
# private subnet

resource "aws_subnet" "deploy_subnet_private1" {
  vpc_id     = aws_vpc.deploy_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "private1"
  }

  availability_zone = "ap-south-1a"
  # map_public_ip_on_launch = false
}

resource "aws_subnet" "deploy_subnet_private2" {
  vpc_id     = aws_vpc.deploy_vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "private2"
  }

  availability_zone = "ap-south-1b"
  # map_public_ip_on_launch = false
}


