resource "aws_cloudwatch_log_group" "rds" {
  name              = "/aws/rds/${var.cluster_name}"
  retention_in_days = var.log_retention_in_days

  tags = {
    Environment = var.environment
  }
}

resource "aws_rds_cluster_parameter_group" "aurora_pg_params" {
  name        = "${var.environment}-aurora-pg-params"
  family      = "aurora-postgresql13"
  description = "Aurora PostgreSQL parameter group for ${var.environment} environment"

  parameter {
    name  = "log_min_duration_statement"
    value = "5000"
  }

  parameter {
    name  = "log_connections"
    value = "1"
  }

  parameter {
    name  = "log_disconnections"
    value = "1"
  }

  parameter {
    name  = "log_error_verbosity"
    value = "default"
  }

  tags = {
    Environment = var.environment
  }
}

resource "aws_cloudwatch_metric_alarm" "high_cpu_utilization" {
  alarm_name          = "${var.environment}-aurora-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Average"
  threshold           = var.cpu_threshold
  alarm_description   = "Triggered when Aurora CPU utilization exceeds ${var.cpu_threshold}% for 10 minutes"
  dimensions = {
    DBClusterIdentifier = var.cluster_name
  }

  tags = {
    Environment = var.environment
  }
}

resource "aws_cloudwatch_metric_alarm" "low_free_storage_space" {
  alarm_name          = "${var.environment}-aurora-low-storage"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2
  metric_name         = "FreeStorageSpace"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Average"
  threshold           = var.storage_threshold
  alarm_description   = "Triggered when Aurora free storage space falls below ${var.storage_threshold} bytes"
  dimensions = {
    DBClusterIdentifier = var.cluster_name
  }

  tags = {
    Environment = var.environment
  }
}

resource "aws_cloudwatch_metric_alarm" "high_db_connections" {
  alarm_name          = "${var.environment}-aurora-high-connections"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "DatabaseConnections"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Average"
  threshold           = var.db_connections_threshold
  alarm_description   = "Triggered when Aurora database connections exceed ${var.db_connections_threshold}"
  dimensions = {
    DBClusterIdentifier = var.cluster_name
  }

  tags = {
    Environment = var.environment
  }
}
