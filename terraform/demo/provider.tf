terraform {
  backend "s3" {
    bucket  = "demo-terraform-statefiles"
    region  = "us-east-1"
    profile = "PersonalAccount"
  }
  required_version = " = 0.12.21"
  required_providers {
    aws      = "~> 2.52"
    template = "~> 2.1"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = "PersonalAccount"
}
