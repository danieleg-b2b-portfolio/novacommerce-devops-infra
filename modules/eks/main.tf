module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name                   = var.cluster_name
  cluster_version                = var.cluster_version
  vpc_id                         = var.vpc_id
  subnet_ids                     = var.private_subnet_ids
  cluster_endpoint_public_access = true

  # Best practice v20: Abilita i permessi di admin per l'utente/ruolo che esegue Terraform
  enable_cluster_creator_admin_permissions = true

  # Gruppo di nodi iniziale (bootstrap) per avviare il cluster e i componenti di sistema (incluso Karpenter)
  eks_managed_node_groups = {
    system = {
      name           = "${var.cluster_name}-system-nodes"
      instance_types = ["t3.medium"]
      min_size       = 1
      max_size       = 3
      desired_size   = 2
      subnet_ids     = var.private_subnet_ids

      labels = {
        role = "system-bootstrap"
      }
    }
  }

  tags = var.tags
}