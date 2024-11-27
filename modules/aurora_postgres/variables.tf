variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "cluster_identifier" {
  description = "Identifier for the Aurora PostgreSQL cluster"
  type        = string
}

variable "database_name" {
  description = "Database name"
  type        = string
}

variable "master_username" {
  description = "Master username for the Aurora PostgreSQL cluster"
  type        = string
}

variable "master_password" {
  description = "Master password for the Aurora PostgreSQL cluster"
  type        = string
  sensitive   = true
}

variable "instance_type" {
  description = "Instance type for the Aurora cluster instances"
  type        = string
}

variable "allocated_storage" {
  description = "Storage allocated for the database in GB"
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
  description = "Preferred maintenance window for the cluster"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the Aurora cluster will be deployed"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnets for the Aurora cluster"
  type        = list(string)
}

variable "db_security_group_id" {
  description = "ID of the security group to attach to the Aurora cluster"
  type        = string
}

variable "db_secret_arn" {
  description = "ARN of the Secrets Manager secret storing database credentials"
  type        = string
}
