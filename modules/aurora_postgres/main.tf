# Aurora Cluster
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

# DB Subnet Group
resource "aws_db_subnet_group" "main" {
  name       = "${var.environment}-db-subnet-group"
  subnet_ids = var.public_subnets # Use public subnets for public accessibility

  tags = {
    Name = "${var.environment}-db-subnet-group"
  }
}

# Aurora Writer Instance
resource "aws_rds_cluster_instance" "writer" {
  identifier           = "${var.environment}-aurora-writer"
  cluster_identifier   = aws_rds_cluster.aurora.id
  instance_class       = var.instance_class
  engine               = "aurora-postgresql"
  publicly_accessible  = true # Enable public accessibility
  db_subnet_group_name = aws_db_subnet_group.main.name
  apply_immediately    = true

  tags = {
    Environment = var.environment
  }
  depends_on = [aws_rds_cluster.aurora]
}

# Wait for Endpoints
resource "null_resource" "wait_for_endpoints" {
  provisioner "local-exec" {
    command = <<EOT
      while true; do
        if nslookup ${aws_rds_cluster.aurora.endpoint} && \
           nslookup ${aws_rds_cluster.aurora.reader_endpoint}; then
          echo "Endpoints are ready."
          break
        fi
        echo "Waiting for endpoints.."
        sleep 150
      done
    EOT
  }

  depends_on = [aws_rds_cluster_instance.writer]
}

# Create Tables
resource "null_resource" "create_tables" {
  depends_on = [null_resource.wait_for_endpoints]

  provisioner "local-exec" {
    command = <<EOT
      PGPASSWORD=${var.master_password} psql -h ${aws_rds_cluster.aurora.endpoint} -U ${var.master_username} -d ${var.database_name} -f ./schema.sql
    EOT
  }
}

# # Aurora Cluster
# resource "aws_rds_cluster" "aurora" {
#   cluster_identifier           = var.cluster_identifier
#   engine                       = "aurora-postgresql"
#   engine_version               = var.engine_version
#   database_name                = var.database_name
#   master_username              = var.master_username
#   master_password              = var.master_password
#   backup_retention_period      = var.backup_retention
#   preferred_maintenance_window = var.preferred_maintenance_window
#   vpc_security_group_ids       = [var.db_security_group_id]
#   db_subnet_group_name         = aws_db_subnet_group.main.name
#   skip_final_snapshot          = true

#   tags = {
#     Environment = var.environment
#   }
# }

# # DB Subnet Group
# resource "aws_db_subnet_group" "main" {
#   name       = "${var.environment}-db-subnet-group"
#   subnet_ids = var.private_subnets

#   tags = {
#     Name = "${var.environment}-db-subnet-group"
#   }
# }

# # Aurora Writer Instance
# resource "aws_rds_cluster_instance" "writer" {
#   identifier           = "${var.environment}-aurora-writer"
#   cluster_identifier   = aws_rds_cluster.aurora.id
#   instance_class       = var.instance_class
#   engine               = "aurora-postgresql"
#   publicly_accessible  = false
#   db_subnet_group_name = aws_db_subnet_group.main.name
#   apply_immediately    = true

#   tags = {
#     Environment = var.environment
#   }
# }

# resource "null_resource" "wait_for_endpoints" {
#   provisioner "local-exec" {
#     command = <<EOT
#       while true; do
#         if nslookup ${aws_rds_cluster.aurora.endpoint} && \
#            nslookup ${aws_rds_cluster.aurora.reader_endpoint}; then
#           echo "Endpoints are ready."
#           break
#         fi
#         echo "Waiting for endpoints..."
#         sleep 180
#       done
#     EOT
#   }

#   depends_on = [aws_rds_cluster.aurora]
# }

# resource "null_resource" "create_tables" {
#   depends_on = [null_resource.wait_for_endpoints]

#   provisioner "local-exec" {
#     command = <<EOT
#       PGPASSWORD=${var.master_password} psql -h ${aws_rds_cluster.aurora.endpoint} -U ${var.master_username} -d ${var.database_name} -f ./schema.sql
#     EOT
#   }
# }
