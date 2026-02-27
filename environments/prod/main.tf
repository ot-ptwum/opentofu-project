terraform {
  required_version = ">= 1.10"

  required_providers {
    aws = {
      source  = "registry.opentofu.org/hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "app_runner" {
  source = "../../modules/app-runner"

  service_name   = var.service_name
  image_uri      = var.image_uri
  container_port = var.container_port
  cpu            = var.cpu
  memory         = var.memory
  auto_deploy    = var.auto_deploy
  env_vars       = var.env_vars
  custom_domain  = var.custom_domain
  tags           = var.tags
}
