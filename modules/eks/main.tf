module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name                   = var.cluster_name
  cluster_version                = var.cluster_version
  cluster_endpoint_public_access = true

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnet_ids

  # Enable IRSA (IAM Roles for Service Accounts)
  enable_cluster_creator_admin_permissions = true

  # Default Managed Node Group for system critical pods (CoreDNS, Karpenter, Argo CD, etc.)
  eks_managed_node_groups = {
    system = {
      name            = "${var.cluster_name}-system-ng"
      instance_types  = ["t3.medium"]
      min_size        = 2
      max_size        = 4
      desired_size    = 2
      subnet_ids      = var.private_subnet_ids
      
      labels = {
        role = "system"
      }
    }
  }

  tags = merge(
    var.tags,
    {
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  )
}