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

resource "aws_iam_role" "apprunner_ecr_access" {
  name = "${var.service_name}-ecr-access-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "build.apprunner.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "apprunner_ecr_policy" {
  role       = aws_iam_role.apprunner_ecr_access.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSAppRunnerServicePolicyForECRAccess"
}

resource "aws_apprunner_service" "this" {
  service_name = var.service_name

  source_configuration {
    authentication_configuration {
      access_role_arn = aws_iam_role.apprunner_ecr_access.arn
    }

    image_repository {
      image_identifier      = var.image_uri
      image_repository_type = "ECR"

      image_configuration {
        port                          = var.container_port
        runtime_environment_variables = var.env_vars
      }
    }

    auto_deployments_enabled = var.auto_deploy_service
  }

  instance_configuration {
    cpu    = var.cpu_size
    memory = var.memory_size
  }

  tags = var.tags
}

resource "aws_apprunner_custom_domain_association" "this" {
  domain_name = var.service_custom_domain
  service_arn = aws_apprunner_service.this.arn
}