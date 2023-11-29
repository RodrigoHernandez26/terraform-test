module "eks" {
	source = "../../infrastructure-modules/eks"

	env         = "dev"
	eks_name    = "demo"
	eks_version = "1.21"
	subnet_ids = var.private_subnet_ids
	# enable_irsa = false

	node_groups = {
		general = {
			capacity_type = "ON_DEMAND"
			instance_types = ["t3.medium"]
			desired_size = 1
			max_size = 1
			min_size = 1
		}
	}
}
