module "vpc" {
  source               = "../../modules/vpc"
  cidr_block           = "10.0.0.0/16"
  name                 = "dev-vpc"
  private_subnet_count = 2
  private_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnet_count  = 2
  public_subnet_cidrs  = ["10.0.101.0/24", "10.0.102.0/24"]
}

module "rds" {
  source              = "../../modules/rds"
  cluster_identifier  = "dev-db-cluster"
  engine_version      = "13.6"
  master_username     = "admin"
  master_password     = var.master_password
  security_group_ids  = ["sg-12345678"]
  subnet_ids          = module.vpc.private_subnet_ids
}

module "monitoring" {
  source             = "../../modules/monitoring"
  cluster_identifier = "dev-db-cluster"
  retention_days     = 7
}
