variable "repositories" {
  type        = list(string)
  description = "Lista dei nomi dei repository dei microservizi da creare"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tag comuni per le risorse ECR"
}