terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "hackaton-team5-tf-state-test"
    key            = "terraform.tfstate"
    region         = "ca-central-1"
    encrypt        = true
    dynamodb_table = "hackaton-team5-tf-state-lock-test"
  }
}

provider "aws" {
  region = "ca-central-1" # Replace with your desired AWS region
}

resource "aws_rds_cluster" "aurora_cluster" {
  cluster_identifier      = "aurora-postgres-cluster"
  engine                  = "aurora-postgresql"
  engine_mode             = "provisioned"
  master_username         = "admin"
  master_password         = "password123" # Use sensitive variables in real scenarios
  backup_retention_period = 7
  preferred_backup_window = "07:00-09:00"
  availability_zones      = ["us-east-1a", "us-east-1b"] # Replace with your AZs
}

resource "aws_rds_cluster_instance" "aurora_instance" {
  count               = 2
  identifier          = "aurora-postgres-instance-${count.index + 1}"
  cluster_identifier  = aws_rds_cluster.aurora_cluster.id
  instance_class      = "db.r5.large"
  engine              = aws_rds_cluster.aurora_cluster.engine
  publicly_accessible = false
}

resource "null_resource" "initialize_schema" {
  depends_on = [aws_rds_cluster.aurora_cluster]

  provisioner "local-exec" {
    command = <<EOT
      PGPASSWORD=password123 psql \
        --host=${aws_rds_cluster.aurora_cluster.endpoint} \
        --port=5432 \
        --username=admin \
        --dbname=postgres \
        --file=schema.sql
    EOT
  }
}
