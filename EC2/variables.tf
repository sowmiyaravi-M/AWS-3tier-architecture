variable "aws_region" {
  default = "us-east-1"
}

variable "key_name" {
  default = "my-key"
}

variable "instance_type" {
  default = "t2.micro" # free-tier eligible
}

variable "db_username" {
  description = "Database master username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database master password"
  type        = string
  sensitive   = true
}
