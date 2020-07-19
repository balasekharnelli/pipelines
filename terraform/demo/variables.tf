variable "aws_region" {
  default = "us-east-1"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Name of environement"
  type        = string
  default     = ""
}

############################################################################################################
# ECS CLUSTER
############################################################################################################

variable "create_ecs_cluster" {
  description = "Controls if ECS should be created"
  type        = bool
  default     = true
}

############################################################################################################
# VPC
############################################################################################################

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = ""
}
variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = ""
}

variable "create_vpc" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  type        = bool
  default     = true
}

variable "secondary_cidr_blocks" {
  description = "List of secondary CIDR blocks to associate with the VPC to extend the IP Address pool"
  type        = list(string)
  default     = []
}

variable "external_nat_ip_ids" {
  description = "List of EIP IDs to be assigned to the NAT Gateways (used in combination with reuse_nat_ips)"
  type        = list(string)
  default     = []
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "azs" {
  description = "A list of availability zones in the region"
  type        = list(string)
  default     = []
}

variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  type        = bool
  default     = true
}
############################################################################################################
# LAUNCH CONFIGURATION
############################################################################################################
variable "name_prefix" {
  default = "demo"
}

variable "instance_type" {
  default = "t2.micro"
}

############################################################################################################
# ASG
############################################################################################################
variable "cluster_minimum_size" {
  default = "1"
}

variable "cluster_maximum_size" {
  default = "3"
}

variable "cluster_desired_capacity" {
  default = "1"
}
