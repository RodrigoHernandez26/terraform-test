provider "aws" {
  region = "us-east-1"

  # skip_credentials_validation = true
  # skip_requesting_account_id  = true
  # skip_metadata_api_check     = true
  # access_key                  = "mock_access_key"
  # secret_key                  = "mock_secret_key"
}

terraform {
  backend "s3" {
    profile  = "devops"
    region   = "us-east-1"
    role_arn = "arn:aws:iam::295439051676:role/terraform"

    bucket         = "rodrigoh-terraform-state-test"
    key            = "terraform.tfstate"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }

  # backend "local" {}
}

module "vpc" {
  source = "./vpc"
  env    = var.env
}

module "eks" {
  source             = "./eks"
  private_subnet_ids = module.vpc.private_subnet_ids
  env                = var.env
}

# module "k8s-addons" {
#   source              = "./k8s-addons"
#   env                 = var.env
#   eks_name            = module.eks.eks_name
#   openid_provider_arn = module.eks.openid_provider_arn
# }

module "ecr" {
  source = "./ecr"
  env    = var.env
}

# module "s3" {
#   source = "./s3"
#   env    = var.env
# }

# module "rds" {
#   source             = "./rds"
#   env                = var.env
#   private_subnet_ids = module.vpc.private_subnet_ids
#   security_group_ids = module.eks.eks_security_group_id
# }

# module "documentdb" {
#   source             = "./documentdb"
#   env                = var.env
#   private_subnet_ids = module.vpc.private_subnet_ids
#   security_group_ids = module.eks.eks_security_group_id
# }

module "sg" {
  source = "./sg"
  env    = var.env
  vpc_id = module.vpc.vpc_id
}

module "msk" {
  source = "./msk"
  env = var.env
  vpc_id = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  security_group_ids = [module.eks.eks_security_group_id, module.sg.sg_id]
}
