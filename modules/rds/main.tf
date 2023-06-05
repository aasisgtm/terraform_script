resource "aws_db_instance" "postgres" {
  identifier             = var.db_name
  engine                 = "postgres"
  engine_version         = "12.11"
  instance_class         = "db.t2.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  username               = var.postgres_username
  password               = var.postgres_password
  db_subnet_group_name   = aws_db_subnet_group.default.name
  parameter_group_name   = "default.postgres12"
  vpc_security_group_ids = [aws_security_group.postgres.id]

  tags = {
    Name    = var.name
    Creator = var.creator
    Project = var.project
  }
}

resource "aws_db_subnet_group" "default" {
  name        = "private-subnet-db"
  subnet_ids  = var.private_subnet_ids
  description = "Private subnet group for PostgreSQL"
}

resource "aws_security_group" "postgres" {
  name_prefix = "postgres-security-group"
  description = "Security group for PostgreSQL"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}