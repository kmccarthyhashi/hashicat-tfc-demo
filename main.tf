terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.30.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

module "ec2_instance" {
  source  = "app.terraform.io/cesteban-demos/ec2-instance/aws"
  version = "2.0.6"

}
