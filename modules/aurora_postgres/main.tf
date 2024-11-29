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
  subnet_ids = var.public_subnets

  tags = {
    Name = "${var.environment}-db-subnet-group"
  }
}

resource "aws_rds_cluster_instance" "writer" {
  identifier           = "${var.environment}-aurora-writer"
  cluster_identifier   = aws_rds_cluster.aurora.id
  instance_class       = var.instance_class
  engine               = "aurora-postgresql"
  publicly_accessible  = true
  db_subnet_group_name = aws_db_subnet_group.main.name
  apply_immediately    = true

  tags = {
    Environment = var.environment
  }

  depends_on = [aws_rds_cluster.aurora]
}

resource "time_sleep" "wait_for_endpoints" {
  depends_on      = [aws_rds_cluster_instance.writer]
  create_duration = "1m"
}

resource "null_resource" "create_tables" {
  depends_on = [time_sleep.wait_for_endpoints]

  provisioner "local-exec" {
    command = <<EOT
      PGPASSWORD=${var.master_password} psql -h ${aws_rds_cluster.aurora.endpoint} -U ${var.master_username} -d ${var.database_name} -f ./schema.sql
    EOT
  }
}
