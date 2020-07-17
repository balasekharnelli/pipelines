variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "project" {
  type    = string
  default = "Demo"
}

variable "cluster_name" {
  type    = string
  default = "Demo"
}

variable "launch_configuration_name" {
  type    = string
  default = "lc"
}

variable "image_id" {
  type    = string
  default = "ami-08b26b905b0d17561"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "iam_instance_profile" {
  type    = string
  default = ""
}

variable "security_groups" {
  type    = list
  default = []
}

variable "instance_root_volume_size" {
  default = "30"
  type    = string
}

variable "security_group_name" {
  default = "sg_demo"
}

variable "autoscaling_group_name" {
  default = "asg"
}

variable "max_num_instances" {
  default = "3"
}

variable "desired_capacity" {
  default = "2"
}
variable "min_num_instances" {
  default = "1"
}

variable "autoscaling_policy_name_up" {
  default = "asg-policy-up"
}

variable "autoscaling_policy_name_down" {
  default = "asg-policy-down"
}

variable "alarm_name_up" {
  default = "asg-alarm-up"
}

variable "alarm_name_down" {
  default = "asg-alarm-up"
}

variable "max_threshold" {
  default = "60"
}

variable "min_threshold" {
  default = "30"
}

variable "key_name" {
  default = "assignment"
}

#VPC
variable "vpc_name" {
  default = "Demo"
}

variable "vpc_cidr_block" {
  default = "10.86.118.0/24"
}

variable "private_subnet_cidr_block_1a" {
  default = "10.86.118.0/26"
}

variable "private_subnet_cidr_block_1b" {
  default = "10.86.118.64/26"
}

variable "private_subnet_cidr_block_1c" {
  default = "10.86.118.128/28"
}

variable "private_subnet_1a_az" {
  default = "us-east-1a"
}

variable "private_subnet_1b_az" {
  default = "us-east-1a"
}

variable "private_subnet_1c_az" {
  default = "us-east-1a"
}

variable "public_subnet_1a_cidr_block" {
  default = "10.86.118.192/27"
}

variable "public_subnet_1a_az" {
  default = "us-east-1a"
}
