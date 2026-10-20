include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules//cluster-stack"
}

inputs = {
  environment          = "prod-primary"
  cluster_name         = "novacommerce-prod-primary-eks"
  vpc_cidr             = "10.20.0.0/16"
  availability_zones   = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  public_subnet_cidrs  = ["10.20.1.0/24", "10.20.2.0/24", "10.20.3.0/24"]
  private_subnet_cidrs = ["10.20.10.0/24", "10.20.11.0/24", "10.20.12.0/24"]
}