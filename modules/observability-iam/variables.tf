variable "cluster_name" {
  type        = string
  description = "Nome del cluster EKS"
}

variable "cluster_oidc_provider_arn" {
  type        = string
  description = "ARN del provider OIDC del cluster EKS"
}

variable "loki_bucket_arn" {
  type        = string
  description = "ARN del bucket S3 destinato a Loki"
}

variable "mimir_bucket_arn" {
  type        = string
  description = "ARN del bucket S3 destinato a Mimir"
}

variable "tempo_bucket_arn" {
  type        = string
  description = "ARN del bucket S3 destinato a Tempo"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tag comuni per le risorse IAM"
}