data "aws_availability_zones" "available" {}

# Public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[0]
  tags = { Name = "public-subnet" }
}

# App subnet
resource "aws_subnet" "app_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.2.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = { Name = "app-subnet" }
}

# DB subnet 1
resource "aws_subnet" "db_subnet_1" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.4.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = { Name = "db-subnet-1" }
}

# DB subnet 2
resource "aws_subnet" "db_subnet_2" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.5.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = { Name = "db-subnet-2" }
}

resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw_id
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}
