## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aiven"></a> [aiven](#requirement\_aiven) | >= 4.0.0, < 5.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aiven"></a> [aiven](#provider\_aiven) | >= 4.0.0, < 5.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aiven_pg.main](https://registry.terraform.io/providers/aiven/aiven/latest/docs/resources/pg) | resource |
| [aiven_pg_database.main](https://registry.terraform.io/providers/aiven/aiven/latest/docs/resources/pg_database) | resource |
| [aiven_pg_user.main](https://registry.terraform.io/providers/aiven/aiven/latest/docs/resources/pg_user) | resource |
| [aiven_pg_user.main](https://registry.terraform.io/providers/aiven/aiven/latest/docs/data-sources/pg_user) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aiven_project"></a> [aiven\_project](#input\_aiven\_project) | Aiven project name | `string` | n/a | yes |
| <a name="input_allowed_ips"></a> [allowed\_ips](#input\_allowed\_ips) | List of allowed IPs | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | Name of the database | `string` | n/a | yes |
| <a name="input_pg_version"></a> [pg\_version](#input\_pg\_version) | PostgreSQL version | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_database_host"></a> [database\_host](#output\_database\_host) | n/a |
| <a name="output_database_name"></a> [database\_name](#output\_database\_name) | n/a |
| <a name="output_database_password"></a> [database\_password](#output\_database\_password) | n/a |
| <a name="output_database_port"></a> [database\_port](#output\_database\_port) | n/a |
| <a name="output_database_url"></a> [database\_url](#output\_database\_url) | n/a |
| <a name="output_database_user"></a> [database\_user](#output\_database\_user) | n/a |
| <a name="output_engine"></a> [engine](#output\_engine) | n/a |
| <a name="output_provider"></a> [provider](#output\_provider) | n/a |
