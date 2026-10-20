output "cluster_name" {
  value       = module.eks.cluster_name
  description = "Nome del cluster EKS"
}

output "cluster_endpoint" {
  value       = module.eks.cluster_endpoint
  description = "Endpoint API del cluster EKS"
}

output "cluster_oidc_provider_arn" {
  value       = module.eks.oidc_provider_arn
  description = "ARN del provider OIDC del cluster (fondamentale per IRSA)"
}

output "cluster_certificate_authority_data" {
  value       = module.eks.cluster_certificate_authority_data
  description = "Certificato CA del cluster per la configurazione di kubectl"
}