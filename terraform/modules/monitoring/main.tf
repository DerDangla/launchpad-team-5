resource "aws_cloudwatch_log_group" "rds_log_group" {
  name              = "/aws/rds/${var.cluster_identifier}"
  retention_in_days = var.retention_days

  tags = {
    Name = var.cluster_identifier
  }
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "${var.cluster_identifier}-cpu-utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Alarm when CPU exceeds 80%"
  dimensions = {
    DBClusterIdentifier = var.cluster_identifier
  }

  tags = {
    Name = var.cluster_identifier
  }
}
