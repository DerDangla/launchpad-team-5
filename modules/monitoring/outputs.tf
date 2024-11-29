
output "log_group_name" {
  description = "Name of the CloudWatch log group for Aurora RDS logs"
  value       = aws_cloudwatch_log_group.rds.name
}

output "parameter_group_name" {
  description = "Name of the RDS cluster parameter group"
  value       = aws_rds_cluster_parameter_group.aurora_pg_params.name
}

output "high_cpu_alarm_arn" {
  description = "ARN of the CloudWatch alarm for high CPU utilization"
  value       = aws_cloudwatch_metric_alarm.high_cpu_utilization.arn
}

output "low_storage_alarm_arn" {
  description = "ARN of the CloudWatch alarm for low free storage space"
  value       = aws_cloudwatch_metric_alarm.low_free_storage_space.arn
}

output "high_db_connections_alarm_arn" {
  description = "ARN of the CloudWatch alarm for high database connections"
  value       = aws_cloudwatch_metric_alarm.high_db_connections.arn
}
