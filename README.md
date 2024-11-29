<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aurora_postgres"></a> [aurora\_postgres](#module\_aurora\_postgres) | ./modules/aurora_postgres | n/a |
| <a name="module_monitoring"></a> [monitoring](#module\_monitoring) | ./modules/monitoring | n/a |
| <a name="module_networking"></a> [networking](#module\_networking) | ./modules/networking | n/a |
| <a name="module_secrets_manager"></a> [secrets\_manager](#module\_secrets\_manager) | ./modules/secrets_manager | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | Allocated storage size in GB | `number` | n/a | yes |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | List of availability zones for the subnets | `list(string)` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region for the resources | `string` | n/a | yes |
| <a name="input_backup_retention"></a> [backup\_retention](#input\_backup\_retention) | Backup retention period in days | `number` | n/a | yes |
| <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier) | Identifier for the Aurora PostgreSQL cluster | `string` | n/a | yes |
| <a name="input_cpu_threshold"></a> [cpu\_threshold](#input\_cpu\_threshold) | Threshold for triggering high CPU utilization alarm | `number` | `80` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | Name of the database | `string` | n/a | yes |
| <a name="input_db_connections_threshold"></a> [db\_connections\_threshold](#input\_db\_connections\_threshold) | Threshold for triggering high database connections alarm | `number` | `100` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Aurora PostgreSQL engine version | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Deployment environment (e.g., dev, prod) | `string` | n/a | yes |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | Instance class for the Aurora DB instances | `string` | `"db.r5.large"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type for the Aurora cluster instances | `string` | n/a | yes |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | Number of days to retain logs in CloudWatch | `number` | `30` | no |
| <a name="input_master_password"></a> [master\_password](#input\_master\_password) | Master password for the database | `string` | n/a | yes |
| <a name="input_master_username"></a> [master\_username](#input\_master\_username) | Master username for the database | `string` | n/a | yes |
| <a name="input_preferred_maintenance_window"></a> [preferred\_maintenance\_window](#input\_preferred\_maintenance\_window) | Preferred maintenance window for the cluster | `string` | n/a | yes |
| <a name="input_private_subnet_cidrs"></a> [private\_subnet\_cidrs](#input\_private\_subnet\_cidrs) | List of CIDR blocks for private subnets | `list(string)` | n/a | yes |
| <a name="input_public_subnet_cidrs"></a> [public\_subnet\_cidrs](#input\_public\_subnet\_cidrs) | List of CIDR blocks for public subnets | `list(string)` | n/a | yes |
| <a name="input_secret_name_prefix"></a> [secret\_name\_prefix](#input\_secret\_name\_prefix) | Prefix for the Secrets Manager secret name | `string` | n/a | yes |
| <a name="input_storage_threshold"></a> [storage\_threshold](#input\_storage\_threshold) | Threshold (in bytes) for triggering low free storage space alarm | `number` | `1000000000` | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | CIDR block for the VPC | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->