terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "novacommerce-tf-state-eu-west-1"
    key            = "shared-services/terraform.tfstate"
    region         = "eu-west-1"
    use_lockfile   = true # S3 Native Locking
    encrypt        = true
  }
}

provider "aws" {
  region = "eu-west-1"

  default_tags {
    tags = {
      Project     = "NovaCommerce"
      Environment = "shared-services"
      ManagedBy   = "Terraform"
    }
  }
}

module "ecr_repositories" {
  source = "../../modules/ecr"

  repositories = [
    "svc-auth",
    "svc-catalog",
    "svc-inventory",
    "svc-cart",
    "svc-order",
    "svc-payment",
    "svc-notification",
    "svc-search",
    "svc-recommendation"
  ]
}