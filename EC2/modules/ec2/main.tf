data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "web_server" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.web_sg_id]
  key_name               = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              echo "<h1>Welcome to Web Tier</h1>" > /var/www/html/index.html
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              EOF

  tags = {
    Name = "web-server"
  }
}

resource "aws_instance" "app_server" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.app_sg_id]
  key_name               = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              echo "<h1>App Tier Running</h1>" > /home/ec2-user/index.html
              EOF

  tags = {
    Name = "app-server"
  }
}
