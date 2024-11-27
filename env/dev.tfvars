aws_region = "ca-central-1"

vpc_cidr_block       = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
environment          = "dev"

secret_name_prefix           = "myapp"
cluster_identifier           = "aurora-dev-cluster"
database_name                = "dev_db"
master_username              = "admin"
master_password              = "devpassword"
instance_type                = "db.r5.large"
allocated_storage            = 50
engine_version               = "13.4"
backup_retention             = 7
preferred_maintenance_window = "sun:05:00-sun:06:00"
