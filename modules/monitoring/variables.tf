variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "cluster_name" {
  description = "Name of the Aurora cluster for monitoring and logging"
  type        = string
}
