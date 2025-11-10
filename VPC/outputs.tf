output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.subnets.public_subnet_id
}

output "private_app_subnet_id" {
  value = module.subnets.private_app_subnet_id
}

output "private_db_subnet_id" {
  value = module.subnets.private_db_subnet_ids

}

output "web_sg_id" {
  value = module.security_groups.web_sg_id
}

output "app_sg_id" {
  value = module.security_groups.app_sg_id
}

output "db_sg_id" {
  value = module.security_groups.db_sg_id
}
