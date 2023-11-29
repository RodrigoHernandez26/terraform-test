module "eks" {
  source = "../../infrastructure-modules/eks"

  env         = "dev"
  eks_name    = "demo"
  eks_version = "1.26"
  subnet_ids  = var.private_subnet_ids

  node_groups = {
    general = {
      capacity_type  = "ON_DEMAND"
      instance_types = ["t3.medium"]
      desired_size   = 1
      max_size       = 1
      min_size       = 1
    }
  }
}
