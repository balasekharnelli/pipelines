############################################################################################################
# ECS CLUSTER
############################################################################################################

output "ecs_cluster_id" {
  description = "The ID that identifies the cluster"
  value       = module.ecs_cluster.ecs_cluster_id
}

output "ecs_cluster_arn" {
  description = "The Amazon Resource Name (ARN) that identifies the cluster"
  value       = module.ecs_cluster.ecs_cluster_arn
}

output "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  value       = module.ecs_cluster.ecs_cluster_name
}

############################################################################################################
# VPC
############################################################################################################
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = module.vpc.vpc_arn
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = module.vpc.nat_gateway_id
}

output "nat_gateway_public_ip" {
  description = "List of NAT public ips"
  value       = module.vpc.nat_gateway_public_ip
}

output "nat_gateway_private_ip" {
  description = "List of NAT private ips"
  value       = module.vpc.nat_gateway_private_ip
}
############################################################################################################
# SG
############################################################################################################
output "security_group_id" {
  value = module.sg.security_group_id
}

############################################################################################################
# LAUNCH CONFIGURATION
############################################################################################################

output "launch_configuration_id" {
  description = "The ID of the launch configuration"
  value       = module.lc.launch_configuration_id
}
