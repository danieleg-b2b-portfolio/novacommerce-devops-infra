output "loki_iam_role_arn" {
  value       = module.loki_irsa.iam_role_arn
  description = "ARN del ruolo IAM IRSA per Loki"
}

output "mimir_iam_role_arn" {
  value       = module.mimir_irsa.iam_role_arn
  description = "ARN del ruolo IAM IRSA per Mimir"
}

output "tempo_iam_role_arn" {
  value       = module.tempo_irsa.iam_role_arn
  description = "ARN del ruolo IAM IRSA per Tempo"
}