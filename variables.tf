variable "aws_region" {
  description = "AWS region for the resources"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
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

variable "availability_zones" {
  description = "List of availability zones for the subnets"
  type        = list(string)
}

variable "environment" {
  description = "Deployment environment (e.g., dev, prod)"
  type        = string
}

variable "secret_name_prefix" {
  description = "Prefix for the Secrets Manager secret name"
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

variable "cluster_identifier" {
  description = "Identifier for the Aurora PostgreSQL cluster"
  type        = string
}

variable "database_name" {
  description = "Name of the database"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the Aurora cluster instances"
  type        = string
}

variable "allocated_storage" {
  description = "Allocated storage size in GB"
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

variable "log_retention_in_days" {
  description = "Number of days to retain logs in CloudWatch"
  type        = number
  default     = 30
}

variable "cpu_threshold" {
  description = "Threshold for triggering high CPU utilization alarm"
  type        = number
  default     = 80
}

variable "storage_threshold" {
  description = "Threshold (in bytes) for triggering low free storage space alarm"
  type        = number
  default     = 1000000000
}

variable "db_connections_threshold" {
  description = "Threshold for triggering high database connections alarm"
  type        = number
  default     = 100
}

variable "instance_class" {
  description = "Instance class for the Aurora DB instances"
  type        = string
  default     = "db.r5.large"
}
