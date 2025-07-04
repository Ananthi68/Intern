provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "generated" {
  key_name   = "terraform-key"
  public_key = file("${path.module}/terraform-key.pub")
}

module "vpc" {
  source = "./modules/vpc"
  environment = "training"
}

module "ec2" {
  source           = "./modules/ec2"
  instance_type    = "t2.micro"
  subnet_id        = module.vpc.public_subnet_ids[0]
  key_name         = aws_key_pair.generated.key_name
  instance_name    = "training-ec2"
  private_key_path = var.private_key_path
}

module "rds" {
  source             = "./modules/rds"
  db_name            = "mydb"
  db_username        = "admin"
  db_password        = "MySecurePassword123!"
  subnet_ids         = module.vpc.private_subnet_ids
  security_group_ids = [module.vpc.database_sg_id]
}
