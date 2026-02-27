output "service_url" {
  description = "Auto-assigned App Runner service URL"
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
  value       = length(aws_apprunner_custom_domain_association.this) > 0 ? aws_apprunner_custom_domain_association.this[0].certificate_validation_records : []
}