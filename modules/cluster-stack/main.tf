# 1. Modulo Atomico VPC
module "vpc" {
  source = "../vpc"

  vpc_name             = "${var.cluster_name}-vpc"
  vpc_cidr             = var.vpc_cidr
  environment          = var.environment
  cluster_name         = var.cluster_name
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  tags                 = var.tags
}

# 2. Modulo Atomico EKS
module "eks" {
  source = "../eks"

  cluster_name       = var.cluster_name
  cluster_version    = var.cluster_version
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  environment        = var.environment
  tags               = var.tags
}

# 3. Modulo Atomico Karpenter
module "karpenter" {
  source = "../karpenter"

  cluster_name              = module.eks.cluster_name
  cluster_endpoint          = module.eks.cluster_endpoint
  cluster_oidc_provider_arn = module.eks.oidc_provider_arn
  tags                      = var.tags
}