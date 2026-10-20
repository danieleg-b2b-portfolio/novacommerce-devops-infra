variable "cluster_name" {
  type        = string
  description = "Nome del cluster EKS"
}

variable "cluster_version" {
  type        = string
  description = "Versione di Kubernetes"
  default     = "1.30"
}

variable "vpc_id" {
  type        = string
  description = "ID della VPC in cui creare il cluster"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Lista degli ID delle subnet private per i nodi e il control plane"
}

variable "environment" {
  type        = string
  description = "Ambiente di riferimento (es. dev, prod)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tag comuni per le risorse"
}