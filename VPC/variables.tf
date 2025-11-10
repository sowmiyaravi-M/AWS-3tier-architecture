# ────────────────────────────────
# Root Variables for 3-Tier Architecture
# ────────────────────────────────

# ----- VPC Variables -----
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "3tier-vpc"
}

# ----- Subnet Variables -----
variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_app_subnet_cidr" {
  description = "CIDR block for the private app subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_db_subnet_cidr" {
  description = "CIDR block for the private DB subnet"
  type        = string
  default     = "10.0.3.0/24"
}

# ----- EC2 Variables -----
variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID to use for EC2 instances"
  type        = string
  default     = "ami-0dee22c13ea7a9a67" # Amazon Linux 2 (ap-south-1)
}

# ----- RDS Variables -----
variable "db_instance_class" {
  description = "RDS instance type"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "mydb"
}

variable "db_username" {
  description = "Master username for RDS"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Master password for RDS"
  type        = string
  default     = "Admin12345"
  sensitive   = true
}
