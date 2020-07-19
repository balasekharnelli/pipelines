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
  default = "asg-alarm-down"
}

variable "max_threshold" {
  default = "60"
}

variable "min_threshold" {
  default = "30"
}
