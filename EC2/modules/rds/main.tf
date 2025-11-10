resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db-subnet-group"
  subnet_ids = [var.private_db_subnet_1, var.private_db_subnet_2]  
  tags = {
    Name = "db-subnet-group"
  }
}


resource "aws_db_instance" "db_instance" {
  identifier              = "mydb-instance"
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  username                = var.db_username
  password                = var.db_password
  skip_final_snapshot     = true
  vpc_security_group_ids  = [var.db_sg_id]
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  publicly_accessible     = false

  tags = {
    Name = "db-tier"
  }
}
