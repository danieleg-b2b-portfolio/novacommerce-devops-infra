variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes version"
  default     = "1.30"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where EKS will be deployed"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for worker nodes"
}

variable "environment" {
  type        = string
  description = "Environment stage (dev, prod, dr)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Common resource tags"
}