output "vpc_id" {
  description = "The ID of the VPC"
  value       = concat(aws_vpc.this.*.id, [""])[0]
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = concat(aws_vpc.this.*.arn, [""])[0]
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = concat(aws_vpc.this.*.cidr_block, [""])[0]
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public.*.id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private.*.id
}

output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = "${aws_nat_gateway.this.*.id}"
}

output "nat_gateway_public_ip" {
  description = "List of NAT public ips"
  value       = "${aws_eip.nat.*.public_ip}"
}

output "nat_gateway_private_ip" {
  description = "List of NAT private ips"
  value       = "${aws_eip.nat.*.private_ip}"
}
