output "db_credentials_secret_arn" {
  description = "The ARN of the Secrets Manager secret for database credentials."
  value       = aws_secretsmanager_secret.db_credentials.arn
}

output "db_credentials_secret_name" {
  description = "The name of the Secrets Manager secret for database credentials."
  value       = aws_secretsmanager_secret.db_credentials.name
}

output "db_credentials_secret_version_id" {
  description = "The version ID of the Secrets Manager secret for database credentials."
  value       = aws_secretsmanager_secret_version.db_credentials_version.version_id
}

output "db_credentials_secret_string" {
  description = "The secret string (username and password) stored in the Secrets Manager secret."
  value       = aws_secretsmanager_secret_version.db_credentials_version.secret_string
  sensitive   = true
}

output "db_credentials_secret_tags" {
  description = "The tags assigned to the Secrets Manager secret."
  value       = aws_secretsmanager_secret.db_credentials.tags
}
