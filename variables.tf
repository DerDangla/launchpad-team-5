variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "cluster_identifier" {
  description = "Aurora cluster identifier"
  type        = string
}

variable "database_name" {
  description = "Database name"
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

variable "instance_type" {
  description = "Instance type for the Aurora cluster"
  type        = string
}

variable "allocated_storage" {
  description = "Storage allocated to the database in GB"
  type        = number
}

variable "engine_version" {
  description = "Aurora PostgreSQL engine version"
  type        = string
}

variable "backup_retention" {
  description = "Backup retention period in days"
  type        = number
}

variable "preferred_maintenance_window" {
  description = "Preferred maintenance window"
  type        = string
}
