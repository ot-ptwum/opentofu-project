output "service_url" {
  description = "Public URL of the App Runner service"
  value       = "https://${aws_apprunner_service.this.service_url}"
}

output "service_arn" {
  value = aws_apprunner_service.this.arn
}

output "service_status" {
  value = aws_apprunner_service.this.status
}

output "custom_domain_validation_records" {
  description = "DNS records to add in Cloudflare"
  value       = aws_apprunner_custom_domain_association.this.certificate_validation_records
}