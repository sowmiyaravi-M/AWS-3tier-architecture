resource "aws_security_group" "web" {
  name        = "web-sg"
  vpc_id      = var.vpc_id
  description = "Allow web and SSH traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "app" {
  name        = "app-sg"
  vpc_id      = var.vpc_id
  description = "Allow web-to-app traffic"
}

resource "aws_security_group" "db" {
  name        = "db-sg"
  vpc_id      = var.vpc_id
  description = "Allow app-to-db traffic"
}
