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
