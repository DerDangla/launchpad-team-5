output "rds_user_password" {
  description = "Cluster endpoint for connecting to the database"
  value       = aws_secretsmanager_secret_version.secret.secret_string
}

output "master_username" {
  description = "Master username for the database"
  value        = aws_secretsmanager_secret.example.name
}