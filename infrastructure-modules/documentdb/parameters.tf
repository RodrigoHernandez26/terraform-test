resource "aws_docdb_cluster_parameter_group" "parameter_docdb" {
  family = "docdb5.0"
  name   = var.cluster_name

  parameter {
    name  = "tls"
    value = "disabled"
  }
}