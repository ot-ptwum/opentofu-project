variable "aws_region" {
  type        = string
  description = "AWS region to deploy into"
}

variable "service_name" {
  type        = string
  description = "Name of the App Runner service"
}

variable "image_uri" {
  type        = string
  description = "Full ECR image URI"
}

variable "container_port" {
  type        = string
  description = "Port the container listens on"
  default     = "80"
}

variable "cpu" {
  type        = string
  description = "CPU units (256, 512, 1024, 2048)"
  default     = "256"
}

variable "memory" {
  type        = string
  description = "Memory in MB (512, 1024, 2048, 4096)"
  default     = "512"
}

variable "auto_deploy" {
  type        = bool
  description = "Auto deploy on new ECR image push"
  default     = false
}

variable "env_vars" {
  type        = map(string)
  description = "Environment variables for the container"
  default     = {}
}

variable "custom_domain" {
  type        = string
  description = "Custom domain name. Leave empty to skip."
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {}
}