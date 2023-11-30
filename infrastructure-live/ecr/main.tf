module "ecr" {
  source = "../../infrastructure-modules/ecr"

    env = var.env
    ecr_name = "ecr-test-repository"
    image_mutability = "MUTABLE"
    encrypt_type = "KMS"
    tags = {
        Name = "ecr-test-repository"
    }
}