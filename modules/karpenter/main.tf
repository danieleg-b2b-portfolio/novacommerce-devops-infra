module "karpenter" {
  source  = "terraform-aws-modules/eks/aws//modules/karpenter"
  version = "~> 20.0"

  cluster_name           = var.cluster_name
  cluster_endpoint       = var.cluster_endpoint
  oidc_provider_arn      = var.cluster_oidc_provider_arn
  
  # Abilita la creazione del ruolo IAM per i nodi gestiti da Karpenter
  create_node_iam_role   = true
  enable_irsa            = true

  # Nome personalizzato per la coda SQS degli spot interruption events
  queue_name = "${var.cluster_name}-karpenter-interruptions"

  tags = var.tags
}