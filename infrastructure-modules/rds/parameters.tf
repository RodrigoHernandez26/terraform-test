resource "aws_db_parameter_group" "parameter_rds" {
  name   = "${var.engine}-${var.env}-params"
  family = "postgres15"

  parameter {
    name  = "rds.force_ssl"
    value = "0"
  }

  lifecycle {
    create_before_destroy = true
  }
}