################
# Locals
################
locals {
  max_subnet_length = max(
    length(var.private_subnets)
  )
  nat_gateway_count = 1

  vpc_id = element(
    concat(
      aws_vpc_ipv4_cidr_block_association.this.*.vpc_id,
      aws_vpc.this.*.id,
      [""],
    ),
    0,
  )
}

######
# VPC
######
resource "aws_vpc" "this" {
  count = var.create_vpc ? 1 : 0

  cidr_block           = var.cidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
}

resource "aws_vpc_ipv4_cidr_block_association" "this" {
  count = var.create_vpc && length(var.secondary_cidr_blocks) > 0 ? length(var.secondary_cidr_blocks) : 0

  vpc_id = aws_vpc.this[0].id

  cidr_block = element(var.secondary_cidr_blocks, count.index)
}

###################
# Internet Gateway
###################
resource "aws_internet_gateway" "this" {
  count = var.create_vpc && length(var.public_subnets) > 0 ? 1 : 0

  vpc_id = local.vpc_id
}

##############
# NAT Gateway
##############
locals {
  nat_gateway_ips = split(
    ",",
    var.reuse_nat_ips ? join(",", var.external_nat_ip_ids) : join(",", aws_eip.nat.*.id),
  )
}

resource "aws_eip" "nat" {
  count = var.create_vpc ? 1 : 0

  vpc = true
}

resource "aws_nat_gateway" "this" {
  count = var.create_vpc ? 1 : 0

  allocation_id = element(
    local.nat_gateway_ips,
    var.single_nat_gateway ? 0 : 1
  )
  subnet_id = element(
    aws_subnet.public.*.id,
    var.single_nat_gateway ? 0 : 1
  )

  depends_on = [aws_internet_gateway.this]
}
