# Secrets Manager Module

This Terraform module manages database credentials securely using AWS Secrets Manager. It creates a Secrets Manager secret with a specified name and stores a version of the secret containing the database credentials (username and password) in JSON format. This setup ensures sensitive information is securely stored and easily retrievable for use in applications or services.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name (e.g., dev, prod) | `string` | n/a | yes |
| <a name="input_master_password"></a> [master\_password](#input\_master\_password) | Master password for the database | `string` | n/a | yes |
| <a name="input_master_username"></a> [master\_username](#input\_master\_username) | Master username for the database | `string` | `"dbadmin"` | no |
| <a name="input_secret_name_prefix"></a> [secret\_name\_prefix](#input\_secret\_name\_prefix) | Prefix for the secret name in Secrets Manager | `string` | `"default-prefix"` | no |
