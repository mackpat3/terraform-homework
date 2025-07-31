
#VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc.cidr
  enable_dns_hostnames = var.vpc.dns_hostnames
  enable_dns_support = var.vpc.dns_support
  tags = local.common_tags
}

#Subnets
resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet[0].cidr
  availability_zone = var.subnet[0].az
  map_public_ip_on_launch = var.subnet[0].map_public_ip_on_launch
  tags = {
    name = var.subnet[0].name
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet[1].cidr
  availability_zone = var.subnet[1].az
  map_public_ip_on_launch = var.subnet[1].map_public_ip_on_launch
  tags = {
    name = var.subnet[1].name
  }
}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet[2].cidr
  availability_zone = var.subnet[2].az
  map_public_ip_on_launch = var.subnet[2].map_public_ip_on_launch
  tags = {
    name = var.subnet[2].name
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet[3].cidr
  availability_zone = var.subnet[3].az
  map_public_ip_on_launch = var.subnet[3].map_public_ip_on_launch
  tags = {
    name = var.subnet[3].name
  }
}

#Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.igw
  }
}

#Route Tables
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = var.route_table[0]
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.route_table[1]
  }
}

#Route Table/Subnet Association
resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private.id
}


resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private.id
}

