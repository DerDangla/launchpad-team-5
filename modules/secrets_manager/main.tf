resource "aws_secretsmanager_secret" "db_credentials" {
  name = "${var.secret_name_prefix}-${var.environment}"
}

resource "aws_secretsmanager_secret_version" "db_credentials_version" {
  secret_id = aws_secretsmanager_secret.db_credentials.id
  secret_string = jsonencode({
    username = var.master_username
    password = var.master_password
  })
}

