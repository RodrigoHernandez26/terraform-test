output "eks_name" {
  value = module.eks.eks_name
}

output "eks_security_group_id" {
  value = module.eks.eks_security_group_id
}

output "openid_provider_arn" {
  value = module.eks.openid_provider_arn
}