vpc_cidr_block       = "10.1.0.0/16"
public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnet_cidrs = ["10.1.3.0/24", "10.1.4.0/24"]
environment          = "prod"

cluster_identifier           = "aurora-prod-cluster"
database_name                = "prod_db"
master_username              = "admin"
master_password              = "prodpassword"
instance_type                = "db.r5.large"
allocated_storage            = 100
engine_version               = "13.4"
backup_retention             = 30
preferred_maintenance_window = "sun:02:00-sun:03:00"