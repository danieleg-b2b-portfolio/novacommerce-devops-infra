# --- LOKI IRSA ---
module "loki_irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 5.30"

  role_name = "${var.cluster_name}-loki-irsa"

  role_policy_arns = {
    policy = aws_iam_policy.loki_s3_policy.arn
  }

  oidc_providers = {
    one = {
      provider_arn               = var.cluster_oidc_provider_arn
      namespace_service_accounts = ["observability:loki"]
    }
  }

  tags = var.tags
}

# --- MIMIR IRSA ---
module "mimir_irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 5.30"

  role_name = "${var.cluster_name}-mimir-irsa"

  role_policy_arns = {
    policy = aws_iam_policy.mimir_s3_policy.arn
  }

  oidc_providers = {
    one = {
      provider_arn               = var.cluster_oidc_provider_arn
      namespace_service_accounts = ["observability:mimir"]
    }
  }

  tags = var.tags
}

# --- TEMPO IRSA ---
module "tempo_irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 5.30"

  role_name = "${var.cluster_name}-tempo-irsa"

  role_policy_arns = {
    policy = aws_iam_policy.tempo_s3_policy.arn
  }

  oidc_providers = {
    one = {
      provider_arn               = var.cluster_oidc_provider_arn
      namespace_service_accounts = ["observability:tempo"]
    }
  }

  tags = var.tags
}