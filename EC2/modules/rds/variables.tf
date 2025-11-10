variable "vpc_id" {
  description = "VPC ID for RDS instance"
  type        = string
}

variable "private_db_subnet_1" {
  description = "First private DB subnet ID"
  type        = string
}

variable "private_db_subnet_2" {
  description = "Second private DB subnet ID"
  type        = string
}

variable "db_sg_id" {
  description = "DB security group ID"
  type        = string
}

variable "db_username" {
  description = "Database master username"
  type        = string
}

variable "db_password" {
  description = "Database master password"
  type        = string
  sensitive   = true
}
