resource "random_password" "password" {
  length = 20
  special = false
  override_special = "_%@"
}

resource "aws_db_subnet_group" "default" {
  name        = "rds-subnet-group"
  description = "Terraform example RDS subnet group"
  subnet_ids  = data.aws_subnet_ids.database.ids
}

resource "aws_db_instance" "db1" {
  allocated_storage        = 256 # gigabytes
  backup_retention_period  = 7   # in days
  db_subnet_group_name     = aws_db_subnet_group.default.id
  engine                   = "postgres"
  engine_version           = "12.7"
  identifier               = "db1"
  instance_class           = "db.r3.large"
  multi_az                 = true
  name                     = "db1"
  password                 = random_password.password.result
  port                     = 5432
  storage_encrypted        = true
  storage_type             = "gp2"
  username                 = "admindb1"
  vpc_security_group_ids   = [data.aws_security_group.rds.id]
}