resource "aws_db_subnet_group" "subnet_group" {
  name       = "${var.env}-${var.name}-rds"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.env}-${var.name}-rds"
  }
}