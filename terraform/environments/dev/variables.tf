variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "master_password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
}
