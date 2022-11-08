terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.30.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "hashicat" {
  source  = "app.terraform.io/cesteban-demos/hashicat/aws"
  version = "1.8.0"
  instance_type = var.instance_type
  region = var.region

}

resource "null_resource" "configure-cat-app" {
  depends_on = [module.hashicat.aws_eip_association.hashicat]

  triggers = {
    build_number = timestamp()
  }

  provisioner "file" {
    source      = "files/deploy_app.sh"
    destination = "/home/ubuntu/"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = module.hashicat.tls_private_key.hashicat.private_key_pem
      host        = module.hashicat.aws_eip.hashicat.public_ip
    }
  }
}
