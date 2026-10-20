include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules//ecr"
}

inputs = {
  environment = "shared-services"
  repositories = [
    "novacommerce/frontend",
    "novacommerce/product-catalog",
    "novacommerce/order-service",
    "novacommerce/payment-service"
  ]
}