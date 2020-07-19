################
# Publiс routes
################
resource "aws_route_table" "public" {
  count = var.create_vpc ? 1 : 0

  vpc_id = local.vpc_id
}


resource "aws_route" "public_internet_gateway" {
  count = var.create_vpc ? 1 : 0

  route_table_id         = aws_route_table.public[0].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this[0].id

  timeouts {
    create = "5m"
  }
}

#################
# Private routes
#################
resource "aws_route_table" "private" {
  count = var.create_vpc ? 1 : 0

  vpc_id = local.vpc_id
}

resource "aws_route" "private_nat_gateway" {
  count = var.create_vpc ? 1 : 0

  route_table_id         = element(aws_route_table.private.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.this.*.id, count.index)

  timeouts {
    create = "5m"
  }
}
