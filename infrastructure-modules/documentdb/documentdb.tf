resource "aws_docdb_subnet_group" "subnet" {
  name       = var.cluster_name
  subnet_ids = var.subnet_ids
}

resource "aws_docdb_cluster" "this" {
  skip_final_snapshot             = var.skip_final_snapshot
  db_subnet_group_name            = aws_docdb_subnet_group.subnet.name
  cluster_identifier              = "${var.env}-${var.cluster_name}"
  engine                          = "docdb"
  master_username                 = replace(var.username, "-", "_")
  master_password                 = var.password
  db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.parameter_docdb.name
  vpc_security_group_ids          = var.security_group_ids
}
