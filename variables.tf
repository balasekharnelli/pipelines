variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "project" {
  type    = string
  default = "demo"
}

variable "cluster_name" {
  type    = string
  default = "Demo"
}

variable "launch_configuration_name" {
  type    = string
  default = ""
}

variable "image_id" {
  type    = string
  default = ""
}

variable "instance_type" {
  type    = string
  default = ""
}

variable "iam_instance_profile" {
  type    = string
  default = ""
}

variable "security_groups" {
  type    = list
  default = []
}

variable "key_name" {
  type    = string
  default = ""
}

variable "instance_root_volume_size" {
  default = "10"
  type    = string
}
