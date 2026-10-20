output "vpc_id" {
  description = "ID della VPC creata"
  value       = module.vpc.vpc_id
}

output "private_subnet_ids" {
  description = "ID delle subnet private"
  value       = module.vpc.private_subnet_ids
}

output "cluster_endpoint" {
  description = "Endpoint API del cluster EKS"
  value       = module.eks.cluster_endpoint
}

output "cluster_name" {
  description = "Nome del cluster EKS"
  value       = module.eks.cluster_name
}

output "cluster_oidc_provider_arn" {
  description = "ARN del provider OIDC per IRSA"
  value       = module.eks.oidc_provider_arn
}