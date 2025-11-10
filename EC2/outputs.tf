output "web_instance_public_ip" {
  value = module.ec2.web_public_ip
}

output "rds_endpoint" {
  value = module.rds.db_endpoint
}
