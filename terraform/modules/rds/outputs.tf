output "cluster_endpoint" {
  description = "Cluster endpoint for connecting to the database"
  value       = aws_rds_cluster.main.endpoint
}

output "reader_endpoint" {
  description = "Reader endpoint for read-replicas"
  value       = aws_rds_cluster.main.reader_endpoint
}

output "cluster_arn" {
  description = "ARN of the RDS cluster"
  value       = aws_rds_cluster.main.arn
}

output "master_username" {
  description = "Master username for the database"
  value       = aws_rds_cluster.main.master_username
}