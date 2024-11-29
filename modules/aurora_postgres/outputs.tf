output "aurora_cluster_id" {
  description = "The ID of the Aurora PostgreSQL cluster"
  value       = aws_rds_cluster.aurora.id
}

output "aurora_cluster_endpoint" {
  description = "The endpoint of the Aurora PostgreSQL cluster"
  value       = aws_rds_cluster.aurora.endpoint
}

output "aurora_cluster_reader_endpoint" {
  description = "The reader endpoint of the Aurora PostgreSQL cluster"
  value       = aws_rds_cluster.aurora.reader_endpoint
}

output "aurora_cluster_master_username" {
  description = "The master username for the Aurora PostgreSQL cluster"
  value       = aws_rds_cluster.aurora.master_username
}

output "aurora_cluster_database_name" {
  description = "The database name for the Aurora PostgreSQL cluster"
  value       = aws_rds_cluster.aurora.database_name
}

output "aurora_cluster_port" {
  description = "The port on which the Aurora PostgreSQL cluster is listening"
  value       = aws_rds_cluster.aurora.port
}

output "aurora_cluster_instance_endpoints" {
  description = "The endpoints of the Aurora PostgreSQL cluster instances"
  value       = aws_rds_cluster_instance.aurora.*.endpoint
}

output "aurora_cluster_instance_ids" {
  description = "The IDs of the Aurora PostgreSQL cluster instances"
  value       = aws_rds_cluster_instance.aurora.*.id
}
