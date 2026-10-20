locals {
  default_region = "eu-west-1"
}

# 1. Configurazione del Backend S3 dinamico con Native Locking
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket       = "novacommerce-tf-state-${local.default_region}"
    key          = "${path_relative_to_include()}/terraform.tfstate"
    region       = local.default_region
    encrypt      = true
    use_lockfile = true
  }
}

# 2. Generazione automatica del provider AWS in ciascuna cartella d'ambiente
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_version = ">= 1.10.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project   = "NovaCommerce"
      ManagedBy = "Terragrunt"
    }
  }
}
EOF
}

# 3. Input Globali / Valori di default ereditati da dev, prod/primary e prod/dr
inputs = {
  aws_region      = "eu-west-1"
  cluster_version = "1.30"

  # Calcolo automatico/standard dei subnet offset se riutilizzati tra ambienti
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
}