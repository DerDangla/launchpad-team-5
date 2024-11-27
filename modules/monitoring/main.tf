resource "aws_cloudwatch_log_group" "rds" {
  name              = "/aws/rds/${var.cluster_name}"
  retention_in_days = 30

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

  tags = {
    Environment = var.environment
  }
}
