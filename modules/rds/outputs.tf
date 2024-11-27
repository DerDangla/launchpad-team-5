output "db_cluster_endpoint" {
  description = "The endpoint of the Aurora PostgreSQL cluster"
  value       = aws_rds_cluster.aurora.endpoint
}

output "db_cluster_reader_endpoint" {
  description = "The reader endpoint of the Aurora PostgreSQL cluster"
  value       = aws_rds_cluster.aurora.reader_endpoint
}

output "db_cluster_id" {
  description = "The ID of the Aurora PostgreSQL cluster"
  value       = aws_rds_cluster.aurora.id
}

output "db_cluster_engine_version" {
  description = "The engine version of the Aurora PostgreSQL cluster"
  value       = aws_rds_cluster.aurora.engine_version
}
