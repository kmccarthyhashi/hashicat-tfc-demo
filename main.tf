module "ec2_instance" {
  source  = "app.terraform.io/cesteban-demos/ec2-instance/aws"
  version = "= 1.0.0"

  name = "single-instance"

  #ami                    = "ami-ebd02392"
  instance_type          = "t2.micro"
  #key_name               = "user1"
  monitoring             = true
  #vpc_security_group_ids = ["sg-12345678"]
  #subnet_id              = "subnet-eddcdzz4"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
