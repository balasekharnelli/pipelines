terraform {
  required_version = "~> 0.12.21"
  required_providers {
    aws = "~> 2.52"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = "PersonalAccount"
}
