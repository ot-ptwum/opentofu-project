variable "aws_region" {
  type    = string
  default = "eu-west-1"
}

variable "service_name" {
  type    = string
  default = "fbl-sme-app-backoffice"
}

variable "image_uri" {
  type        = string
  description = "ECR image URI"
}

variable "container_port" {
  type    = string
  default = "80"
}

variable "cpu_size" {
  type    = string
  default = "256"
}

variable "memory_size" {
  type    = string
  default = "512"
}

variable "auto_deploy_service" {
  type    = bool
  default = false
}

variable "env_vars" {
  type    = map(string)
  default = {}
}

variable "tags" {
  type    = map(string)
  default = { Managed = "orangetech.io" }
}

variable "service_custom_domain" {
  type        = string
  description = "Custom domain for the App Runner service"
}