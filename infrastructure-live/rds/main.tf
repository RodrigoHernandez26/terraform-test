module "rds" {
  source = "../../infrastructure-modules/rds"

  env                 = var.env
  name                = "rds-test"
  allocated_storage   = 20
  engine              = "postgres"
  instance_class      = "db.t3.micro"
  username            = "postgres"
  password            = "postgres"
  skip_final_snapshot = true
  security_group_ids  = [var.security_group_ids]
  subnet_ids          = var.private_subnet_ids
  multi-az            = false
}