module "ecr-rds-sample-project" {
  source = "../../infrastructure-modules/ecr"

  env              = var.env
  ecr_name         = "rds-sample-project"
  image_mutability = "MUTABLE"
  encrypt_type     = "KMS"
  tags = {
    Name = "rds-sample-project"
  }
}

# module "ecr-docdb-sample-project" {
#   source = "../../infrastructure-modules/ecr"

#   env              = var.env
#   ecr_name         = "docdb-sample-project"
#   image_mutability = "MUTABLE"
#   encrypt_type     = "KMS"
#   tags = {
#     Name = "docdb-sample-project"
#   }
# }
