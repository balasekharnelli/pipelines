variable "instance_type" {
  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    stg     = "t2.medium"
    prd     = "t2.large"
  }
}
