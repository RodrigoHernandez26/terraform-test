module "bucket1" {
  source = "../../infrastructure-modules/s3"

  env  = var.env
  name = "teste-bucket1"
}

module "bucket2" {
  source = "../../infrastructure-modules/s3"

  env        = var.env
  name       = "teste-bucket2"
  versioning = true
}