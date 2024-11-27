variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "secret_name_prefix" {
  description = "Prefix for the secret name in Secrets Manager"
  type        = string
}

variable "master_username" {
  description = "Master username for the database"
  type        = string
}

variable "master_password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
}
