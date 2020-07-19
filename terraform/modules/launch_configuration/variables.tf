variable "create_lc" {
  default = true
}

variable "name_prefix" {
  default = ""
}

variable "image_id" {
  default = ""
}

variable "instance_type" {
  default = ""
}

variable "iam_instance_profile" {
  default = ""
}

variable "key_name" {
  default = ""
}

variable "security_groups" {
  default = []
}

variable "associate_public_ip_address" {
  default = false
}

variable "user_data" {
  default = ""
}

variable "user_data_base64" {
  default = null
}

variable "enable_monitoring" {
  default = false
}

variable "ebs_optimized" {
  default = false
}

variable "ebs_block_device" {
  type    = list(map(string))
  default = []
}

variable "ephemeral_block_device" {
  type    = list(map(string))
  default = []
}

variable "root_block_device" {
  type    = list(map(string))
  default = []
}
