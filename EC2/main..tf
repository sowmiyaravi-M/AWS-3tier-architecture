resource "aws_key_pair" "my_key" {
  key_name   = "my-key"
  public_key = file("${pathexpand("~/.ssh/id_rsa.pub")}")
}

module "vpc" {
  source = "./modules/vpc"
}

module "subnets" {
  source = "./modules/subnets"
  vpc_id = module.vpc.vpc_id
  igw_id = module.vpc.igw_id
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source                = "./modules/ec2"
  vpc_id                = module.vpc.vpc_id
  public_subnet_id      = module.subnets.public_subnet_id
  private_subnet_id     = module.subnets.app_subnet_id
  web_sg_id             = module.security_groups.web_sg_id
  app_sg_id             = module.security_groups.app_sg_id
  key_name              = aws_key_pair.my_key.key_name
  instance_type         = var.instance_type
}

module "rds" {
  source            = "./modules/rds"
  vpc_id            = module.vpc.vpc_id
  private_db_subnet_1 = module.subnets.db_subnet_1_id
  private_db_subnet_2 = module.subnets.db_subnet_2_id
  db_sg_id          = module.security_groups.db_sg_id
  db_username       = var.db_username
  db_password       = var.db_password
}
