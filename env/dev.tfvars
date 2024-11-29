aws_region = "ca-central-1"

vpc_cidr_block       = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones   = ["ca-central-1a", "ca-central-1b"]
environment          = "dev"

secret_name_prefix           = "team5hackssss"
cluster_identifier           = "aurora-dev-cluster"
database_name                = "dev_db"
master_username              = "dbadmin"
master_password              = "devpassword"
instance_type                = "db.r5.large"
allocated_storage            = 50
engine_version               = "16.4"
backup_retention             = 7
preferred_maintenance_window = "sun:05:00-sun:06:00"

log_retention_in_days    = 30
cpu_threshold            = 80
storage_threshold        = 1000000000
db_connections_threshold = 100
