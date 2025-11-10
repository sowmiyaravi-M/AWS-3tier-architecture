variable "vpc_id" {
  description = "VPC ID where subnets will be created"
  type        = string
}

variable "igw_id" {
  description = "Internet Gateway ID for public route"
  type        = string
}
