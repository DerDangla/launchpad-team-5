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
| <a name="module_networking"></a> [networking](#module\_networking) | ./modules/networking | n/a |
| <a name="module_secrets_manager"></a> [secrets\_manager](#module\_secrets\_manager) | ./modules/secrets_manager | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | Storage allocated for the database in GB | `number` | n/a | yes |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | List of availability zones for the VPC subnets | `list(string)` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region where resources will be provisioned | `string` | `"ca-central-1"` | no |
| <a name="input_backup_retention"></a> [backup\_retention](#input\_backup\_retention) | Backup retention period in days | `number` | n/a | yes |
| <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier) | Identifier for the Aurora PostgreSQL cluster | `string` | n/a | yes |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | Database name | `string` | n/a | yes |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Aurora PostgreSQL engine version | `string` | `"16.4"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name (e.g., dev, prod) | `string` | n/a | yes |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | Instance class for the Aurora DB instances | `string` | `"db.r5.large"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type for the Aurora cluster instances | `string` | n/a | yes |
| <a name="input_master_password"></a> [master\_password](#input\_master\_password) | Master password for the database | `string` | n/a | yes |
| <a name="input_master_username"></a> [master\_username](#input\_master\_username) | Master username for the database | `string` | `"dbadmin"` | no |
| <a name="input_preferred_maintenance_window"></a> [preferred\_maintenance\_window](#input\_preferred\_maintenance\_window) | Preferred maintenance window for the cluster | `string` | n/a | yes |
| <a name="input_private_subnet_cidrs"></a> [private\_subnet\_cidrs](#input\_private\_subnet\_cidrs) | List of CIDR blocks for private subnets | `list(string)` | n/a | yes |
| <a name="input_public_subnet_cidrs"></a> [public\_subnet\_cidrs](#input\_public\_subnet\_cidrs) | List of CIDR blocks for public subnets | `list(string)` | n/a | yes |
| <a name="input_secret_name_prefix"></a> [secret\_name\_prefix](#input\_secret\_name\_prefix) | Prefix for the secret name in Secrets Manager | `string` | `"default-prefix"` | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | The CIDR block for the VPC | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->