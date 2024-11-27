variable "cluster_identifier" {
  description = "Identifier for the Aurora cluster"
  type        = string
}

variable "retention_days" {
  description = "Number of days to retain CloudWatch logs"
  type        = number
  default     = 7
}
