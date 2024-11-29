<!-- BEGIN_TF_DOCS -->
# Monitoring Module
This Monitoring module sets up monitoring and logging for an Amazon Aurora PostgreSQL cluster. It creates a CloudWatch log group for RDS logs with a specified retention period and configures a custom RDS cluster parameter group to enable detailed logging of slow queries, connections, and disconnections. The module also provisions CloudWatch alarms to monitor critical metrics, including high CPU utilization, low free storage space, and excessive database connections, triggering alerts when thresholds are breached.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_metric_alarm.high_cpu_utilization](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.high_db_connections](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.low_free_storage_space](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_rds_cluster_parameter_group.aurora_pg_params](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_parameter_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the Aurora cluster for monitoring and logging | `string` | n/a | yes |
| <a name="input_cpu_threshold"></a> [cpu\_threshold](#input\_cpu\_threshold) | Threshold for triggering high CPU utilization alarm | `number` | `80` | no |
| <a name="input_db_connections_threshold"></a> [db\_connections\_threshold](#input\_db\_connections\_threshold) | Threshold for triggering high database connections alarm | `number` | `100` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name (e.g., dev, prod) | `string` | n/a | yes |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | Number of days to retain logs in CloudWatch | `number` | `30` | no |
| <a name="input_storage_threshold"></a> [storage\_threshold](#input\_storage\_threshold) | Threshold (in bytes) for triggering low free storage space alarm | `number` | `1000000000` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_high_cpu_alarm_arn"></a> [high\_cpu\_alarm\_arn](#output\_high\_cpu\_alarm\_arn) | ARN of the CloudWatch alarm for high CPU utilization |
| <a name="output_high_db_connections_alarm_arn"></a> [high\_db\_connections\_alarm\_arn](#output\_high\_db\_connections\_alarm\_arn) | ARN of the CloudWatch alarm for high database connections |
| <a name="output_log_group_name"></a> [log\_group\_name](#output\_log\_group\_name) | Name of the CloudWatch log group for Aurora RDS logs |
| <a name="output_low_storage_alarm_arn"></a> [low\_storage\_alarm\_arn](#output\_low\_storage\_alarm\_arn) | ARN of the CloudWatch alarm for low free storage space |
| <a name="output_parameter_group_name"></a> [parameter\_group\_name](#output\_parameter\_group\_name) | Name of the RDS cluster parameter group |
<!-- END_TF_DOCS -->