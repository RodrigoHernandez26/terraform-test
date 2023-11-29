provider "aws" {
    region = "us-east-1"
}


terraform {
    backend "s3" {
        profile = "devops"
        region = "us-east-1"
        role_arn = "arn:aws:iam::295439051676:role/terraform"

        bucket = "rodrigoh-terraform-state-test"
        key    = "terraform.tfstate"
        dynamodb_table = "terraform-lock-table"
        encrypt = true
    }
}

module "vpc" {
    source = "./vpc"
}

module "eks" {
    source = "./eks"
    private_subnet_ids = module.vpc.private_subnet_ids
}

module "s3" {
    source = "./s3"
}