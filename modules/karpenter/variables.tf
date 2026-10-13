variable "cluster_name" {
  type        = string
  description = "Nome del cluster EKS"
}

variable "cluster_endpoint" {
  type        = string
  description = "Endpoint API del cluster EKS"
}

variable "cluster_oidc_provider_arn" {
  type        = string
  description = "ARN del provider OIDC del cluster per IRSA"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tag comuni per le risorse Karpenter"
}