terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "hackaton-team5-tf-state"
    key            = "terraform.tfstate"
    region         = "ca-central-1"
    encrypt        = true
    dynamodb_table = "hackaton-team5-tf-state-lock"
  }
}

provider "aws" {
  region = var.aws_region
}

module "networking" {
  source               = "./modules/networking"
  vpc_cidr_block       = var.vpc_cidr_block
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  environment          = var.environment
  availability_zones   = var.availability_zones
}

module "secrets_manager" {
  source             = "./modules/secrets_manager"
  environment        = var.environment
  secret_name_prefix = var.secret_name_prefix
  master_username    = var.master_username
  master_password    = var.master_password
}

module "aurora_postgres" {
  source = "./modules/aurora_postgres"

  environment                  = var.environment
  cluster_identifier           = var.cluster_identifier
  database_name                = var.database_name
  master_username              = jsondecode(module.secrets_manager.db_credentials_secret_string).username
  master_password              = jsondecode(module.secrets_manager.db_credentials_secret_string).password
  instance_type                = var.instance_type
  allocated_storage            = var.allocated_storage
  engine_version               = var.engine_version
  backup_retention             = var.backup_retention
  preferred_maintenance_window = var.preferred_maintenance_window
  vpc_id                       = module.networking.vpc_id
  public_subnets               = module.networking.public_subnets
  db_security_group_id         = module.networking.db_security_group_id
  db_secret_arn                = module.secrets_manager.db_credentials_secret_arn
  instance_class               = var.instance_class
}

# module "monitoring" {
#   source       = "./modules/monitoring"
#   environment  = var.environment
#   cluster_name = var.cluster_identifier
# }
