output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "app_subnet_id" {
  value = aws_subnet.app_subnet.id
}

output "db_subnet_1_id" {
  value = aws_subnet.db_subnet_1.id
}

output "db_subnet_2_id" {
  value = aws_subnet.db_subnet_2.id
}
