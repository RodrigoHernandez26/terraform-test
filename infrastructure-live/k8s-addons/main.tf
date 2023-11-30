data "aws_eks_cluster" "eks" {
    name = "dev-demo"
}

data "aws_eks_cluster_auth" "eks" {
    name = "dev-demo"
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.eks.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.eks.name]
      command     = "aws"
    }
  }
}

module "k8s-addons" {
  source = "../../infrastructure-modules/k8s-addons"

    env = var.env
    eks_name = var.eks_name
    enable_cluster_autoscaler = true
    cluster_autoscaler_helm_verion = "9.28.0"

    openid_provider_arn = var.openid_provider_arn
}