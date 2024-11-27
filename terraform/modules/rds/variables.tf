variable "cluster_identifier" {
  description = "Identifier for the Aurora cluster"
  type        = string
}

variable "engine_version" {
  description = "Aurora PostgreSQL engine version"
  type        = string
  default     = "13.6"
}

variable "master_username" {
  description = "Master username for the database"
  type        = string
}

variable "master_password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
  default     = ""
}

variable "security_group_ids" {
  description = "List of security group IDs for the cluster"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs for the cluster"
  type        = list(string)
}
