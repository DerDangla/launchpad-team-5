resource "aws_kms_key" "default" {
  description             = "KMS key for RDS"
  deletion_window_in_days = 30
  is_enabled              = true
  enable_key_rotation     = true

}

resource "aws_secretsmanager_secret" "example" {
  kms_key_id              = aws_kms_key.default.key_id
  name                    = var.rds_master_username
  description             = "RDS Admin password"
  recovery_window_in_days = 14
}

resource "random_password" "password" {
  length  = 16
  special = true
}

resource "aws_secretsmanager_secret_version" "secret" {
  secret_id     = aws_secretsmanager_secret.example.id
  secret_string = random_password.password.result
}