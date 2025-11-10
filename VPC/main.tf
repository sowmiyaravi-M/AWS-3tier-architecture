module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
}

module "subnets" {
  source = "./modules/subnets"
  vpc_id = module.vpc.vpc_id
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source            = "./modules/ec2"
  public_subnet_id  = module.subnets.public_subnet_id
  private_subnet_id = module.subnets.private_app_subnet_id
  web_sg_id         = module.security_groups.web_sg_id
  app_sg_id         = module.security_groups.app_sg_id
}

module "rds" {
  source              = "./modules/rds"
  private_db_subnet_1 = module.subnets.private_db_subnet_ids[0]
  private_db_subnet_2 = module.subnets.private_db_subnet_ids[1]
  db_sg_id            = module.security_groups.db_sg_id
}
