variable "create_asg" {
  default = true
}

variable "name_prefix" {
  default = ""
}

variable "subnet_ids" {
  default = []
}

variable "launch_configuration" {
  default = ""
}

variable "cluster_minimum_size" {
  default = ""
}

variable "cluster_maximum_size" {
  default = ""
}

variable "cluster_desired_capacity" {
  default = ""
}
