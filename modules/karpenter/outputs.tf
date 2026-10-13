output "node_iam_role_arn" {
  value       = module.karpenter.node_iam_role_arn
  description = "ARN del ruolo IAM utilizzato dai nodi EC2 avviati da Karpenter"
}

output "node_iam_role_name" {
  value       = module.karpenter.node_iam_role_name
  description = "Nome del ruolo IAM dei nodi Karpenter"
}

output "queue_name" {
  value       = module.karpenter.queue_name
  description = "Nome della coda SQS per le interruzioni Spot"
}

output "iam_role_arn" {
  value       = module.karpenter.iam_role_arn
  description = "ARN del ruolo IAM IRSA assunto dal controller Karpenter nel cluster"
}