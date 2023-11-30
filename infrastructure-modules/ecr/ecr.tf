resource "aws_ecr_repository" "this" {
  name                 = "${var.env}-${var.ecr_name}"
  image_tag_mutability = var.image_mutability

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = var.encrypt_type
  }

  tags = var.tags
}