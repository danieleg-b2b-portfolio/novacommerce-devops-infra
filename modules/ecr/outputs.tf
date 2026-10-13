output "repository_urls" {
  value       = { for k, repo in aws_ecr_repository.repos : k => repo.repository_url }
  description = "Mappa dei nomi dei repository con i rispettivi URL ECR"
}

output "repository_arns" {
  value       = { for k, repo in aws_ecr_repository.repos : k => repo.arn }
  description = "Mappa dei nomi dei repository con i rispettivi ARN"
}