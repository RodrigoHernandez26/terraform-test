module "documentdb" {
  source = "../../infrastructure-modules/documentdb"

  env                 = var.env
  cluster_name        = "docdb-test"
  username            = "docb_test_admin"
  password            = "admin123456"
  instance_class      = "db.t3.medium"
  subnet_ids          = var.private_subnet_ids
  skip_final_snapshot = true
  security_group_ids  = [var.security_group_ids]
}