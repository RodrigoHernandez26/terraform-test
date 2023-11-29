module "bucket1" {
  source = "../../infrastructure-modules/s3"

  env  = "dev"
  name = "teste-bucket1"
}

module "bucket2" {
  source = "../../infrastructure-modules/s3"

  env        = "dev"
  name       = "teste-bucket2"
  versioning = true
}