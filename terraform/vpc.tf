### VPC ###

resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
}

#Subnets
resource "aws_subnet" "private-1a" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = var.private_subnet_1a_az
  cidr_block              = var.private_subnet_cidr_block_1a
  map_public_ip_on_launch = false
}

resource "aws_subnet" "private-1b" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = var.private_subnet_1b_az
  cidr_block              = var.private_subnet_cidr_block_1b
  map_public_ip_on_launch = false
}

resource "aws_subnet" "private-1c" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = var.private_subnet_1c_az
  cidr_block              = var.private_subnet_cidr_block_1c
  map_public_ip_on_launch = false
}

resource "aws_subnet" "public-1a" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = var.public_subnet_1a_az
  cidr_block              = var.public_subnet_1a_cidr_block
  map_public_ip_on_launch = true
}
### INTERNET GATEWAY ###

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id
}

### ROUTE TABLE CREATION ###

resource "aws_route_table" "public-1a" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table" "private-1a" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table" "private-1b" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table" "private-1c" {
  vpc_id = aws_vpc.vpc.id
}

###  GATEWAY ROUTES  ###

resource "aws_route" "public-1a" {
  route_table_id         = aws_route_table.public-1a.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig.id
}

resource "aws_route" "private-1a" {
  route_table_id         = aws_route_table.private-1a.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.ngw-1a.id
}

resource "aws_route" "private-1b" {
  route_table_id         = aws_route_table.private-1b.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.ngw-1a.id
}

resource "aws_route" "private-1c" {
  route_table_id         = aws_route_table.private-1c.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.ngw-1a.id
}
### ELASTIC IP'S FOR NAT GATEWAYS ###

resource "aws_eip" "nat-1a" {
  vpc = true
}

### NAT GATEWAYS ###

resource "aws_nat_gateway" "ngw-1a" {
  allocation_id = aws_eip.nat-1a.id
  subnet_id     = aws_subnet.public-1a.id
  depends_on    = [aws_internet_gateway.ig]
}

# ROUTE TABLE ASSOCIATIONS

resource "aws_route_table_association" "app-1a" {
  subnet_id      = aws_subnet.private-1a.id
  route_table_id = aws_route_table.private-1a.id
}

resource "aws_route_table_association" "app-1b" {
  subnet_id      = aws_subnet.private-1b.id
  route_table_id = aws_route_table.private-1b.id
}

resource "aws_route_table_association" "app-1c" {
  subnet_id      = aws_subnet.private-1c.id
  route_table_id = aws_route_table.private-1c.id
}

resource "aws_route_table_association" "public-1a" {
  subnet_id      = aws_subnet.public-1a.id
  route_table_id = aws_route_table.public-1a.id
}
