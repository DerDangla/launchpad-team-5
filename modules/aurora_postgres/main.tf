resource "aws_rds_cluster" "aurora" {
  cluster_identifier           = var.cluster_identifier
  engine                       = "aurora-postgresql"
  engine_version               = var.engine_version
  database_name                = var.database_name
  master_username              = var.master_username
  master_password              = var.master_password
  backup_retention_period      = var.backup_retention
  preferred_maintenance_window = var.preferred_maintenance_window
  vpc_security_group_ids       = [var.db_security_group_id]
  db_subnet_group_name         = aws_db_subnet_group.main.name
  skip_final_snapshot          = true

  tags = {
    Environment = var.environment
  }
}

resource "aws_db_subnet_group" "main" {
  name       = "${var.environment}-db-subnet-group"
  subnet_ids = var.private_subnets

  tags = {
    Name = "${var.environment}-db-subnet-group"
  }
}

resource "null_resource" "create_tables" {
  depends_on = [aws_rds_cluster.aurora]
  provisioner "local-exec" {
    command = <<EOT
      PGPASSWORD=${var.master_password} psql -h ${aws_rds_cluster.aurora.endpoint} -U ${var.master_username} -d ${var.database_name} -f ./schema.sql
    EOT
  }
}
