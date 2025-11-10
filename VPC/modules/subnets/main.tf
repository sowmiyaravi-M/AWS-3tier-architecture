resource "aws_subnet" "public" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private_app" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "private-app-subnet"
  }
}

resource "aws_subnet" "private_db_1" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-south-1c"

  tags = {
    Name = "private-db-subnet-1"
  }
}

resource "aws_subnet" "private_db_2" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "private-db-subnet-2"
  }
}
