variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "secret_name_prefix" {
  description = "Prefix for the secret name in Secrets Manager"
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
  description = "Master username for the database"
  type        = string
}

variable "master_password" {
  description = "Master password for the database"
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
