terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.30.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "hashicat" {
  source  = "app.terraform.io/cesteban-demos/hashicat/aws"
  version = "1.2.0"
  instance_type = var.instance_type

}
