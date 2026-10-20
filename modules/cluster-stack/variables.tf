variable "cluster_name" {
  type        = string
  description = "Nome univoco del cluster EKS"
}

variable "cluster_version" {
  type        = string
  description = "Versione di Kubernetes per EKS"
  default     = "1.30"
}

variable "environment" {
  type        = string
  description = "Nome dell'ambiente (es. dev, staging, prod)"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block per la VPC"
}

variable "availability_zones" {
  type        = list(string)
  description = "Lista delle Availability Zones di AWS"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Lista dei CIDR per le subnet pubbliche"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Lista dei CIDR per le subnet private"
}

variable "tags" {
  type        = map(string)
  description = "Tag aggiuntivi per le risorse"
  default     = {}
}