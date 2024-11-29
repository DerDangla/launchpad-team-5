variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "cluster_name" {
  description = "Name of the Aurora cluster for monitoring and logging"
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
  default     = 1000000000 # 1 GB
}

variable "db_connections_threshold" {
  description = "Threshold for triggering high database connections alarm"
  type        = number
  default     = 100
}
