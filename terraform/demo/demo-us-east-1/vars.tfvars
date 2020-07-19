aws_region   = "us-east-1"
environment  = "demo"
project_name = "assignment"

#VPC
cidr            = "10.70.0.0/16"
azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
private_subnets = ["10.70.11.0/24", "10.70.12.0/24", "10.70.13.0/24"]
public_subnets  = ["10.70.101.0/24", "10.70.102.0/24", "10.70.103.0/24"]
