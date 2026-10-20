include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules//cluster-stack"
}

inputs = {
  aws_region           = "eu-central-1" # Specifica la regione di DR
  environment          = "prod-dr"
  cluster_name         = "novacommerce-prod-dr-eks"
  vpc_cidr             = "10.30.0.0/16"
  availability_zones   = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  public_subnet_cidrs  = ["10.30.1.0/24", "10.30.2.0/24", "10.30.3.0/24"]
  private_subnet_cidrs = ["10.30.10.0/24", "10.30.11.0/24", "10.30.12.0/24"]
}