output "db_secret_arn" {
  description = "The ARN of the Secrets Manager secret for database credentials"
  value       = aws_secretsmanager_secret.db_credentials.arn
}

output "db_secret_name" {
  description = "The name of the Secrets Manager secret"
  value       = aws_secretsmanager_secret.db_credentials.name
}
