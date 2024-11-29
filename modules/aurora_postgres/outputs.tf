output "aurora_cluster_endpoint" {
  description = "The writer endpoint for the Aurora cluster."
  value       = aws_rds_cluster.aurora.endpoint
}

output "aurora_reader_endpoint" {
  description = "The reader endpoint for the Aurora cluster."
  value       = aws_rds_cluster.aurora.reader_endpoint
}

output "aurora_cluster_id" {
  description = "The ID of the Aurora cluster."
  value       = aws_rds_cluster.aurora.id
}

output "aurora_writer_instance_id" {
  description = "The ID of the Aurora writer instance."
  value       = aws_rds_cluster_instance.writer.id
}

output "aurora_database_name" {
  description = "The database name for the Aurora cluster."
  value       = aws_rds_cluster.aurora.database_name
}

output "db_subnet_group_name" {
  description = "The name of the DB subnet group used by Aurora."
  value       = aws_db_subnet_group.main.name
}

output "environment" {
  description = "The deployment environment."
  value       = var.environment
}
