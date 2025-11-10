variable "vpc_id" {
  description = "VPC ID for EC2 instances"
  type        = string
}

variable "public_subnet_id" {
  description = "Public subnet ID for Web EC2"
  type        = string
}

variable "private_subnet_id" {
  description = "Private subnet ID for App EC2"
  type        = string
}

variable "web_sg_id" {
  description = "Security group ID for Web EC2"
  type        = string
}

variable "app_sg_id" {
  description = "Security group ID for App EC2"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name for SSH access"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
}
