data "aws_vpc" "this" {
  id = var.vpc_id
}

resource "aws_security_group" "this" {
  name   = "${var.env}-${var.name}"
  vpc_id = var.vpc_id
}