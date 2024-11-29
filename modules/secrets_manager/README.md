# Secrets Manager Module

This Terraform module manages database credentials securely using AWS Secrets Manager. It creates a Secrets Manager secret with a specified name and stores a version of the secret containing the database credentials (username and password) in JSON format. This setup ensures sensitive information is securely stored and easily retrievable for use in applications or services.

## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret.db_credentials](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.db_credentials_version](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name (e.g., dev, prod) | `string` | n/a | yes |
| <a name="input_master_password"></a> [master\_password](#input\_master\_password) | Master password for the database | `string` | n/a | yes |
| <a name="input_master_username"></a> [master\_username](#input\_master\_username) | Master username for the database | `string` | n/a | yes |
| <a name="input_secret_name_prefix"></a> [secret\_name\_prefix](#input\_secret\_name\_prefix) | Prefix for the secret name in Secrets Manager | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_credentials_secret_arn"></a> [db\_credentials\_secret\_arn](#output\_db\_credentials\_secret\_arn) | The ARN of the Secrets Manager secret for database credentials. |
| <a name="output_db_credentials_secret_name"></a> [db\_credentials\_secret\_name](#output\_db\_credentials\_secret\_name) | The name of the Secrets Manager secret for database credentials. |
| <a name="output_db_credentials_secret_string"></a> [db\_credentials\_secret\_string](#output\_db\_credentials\_secret\_string) | The secret string (username and password) stored in the Secrets Manager secret. |
| <a name="output_db_credentials_secret_tags"></a> [db\_credentials\_secret\_tags](#output\_db\_credentials\_secret\_tags) | The tags assigned to the Secrets Manager secret. |
| <a name="output_db_credentials_secret_version_id"></a> [db\_credentials\_secret\_version\_id](#output\_db\_credentials\_secret\_version\_id) | The version ID of the Secrets Manager secret for database credentials. |