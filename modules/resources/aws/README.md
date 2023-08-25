# aws

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret.redis_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.redis_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [random_password.redis_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_credentials_config"></a> [custom\_credentials\_config](#input\_custom\_credentials\_config) | Specify the configuration settings for Redis to pass custom credentials during creation. | `any` | <pre>{<br>  "password": ""<br>}</pre> | no |
| <a name="input_custom_credentials_enabled"></a> [custom\_credentials\_enabled](#input\_custom\_credentials\_enabled) | Specifies whether to enable custom credentials for Redis. | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment in which the infrastructure is being deployed (e.g., production, staging, development) | `string` | `"test"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name identifier for module to be added as suffix to resources | `string` | `"test"` | no |
| <a name="input_recovery_window_aws_secret"></a> [recovery\_window\_aws\_secret](#input\_recovery\_window\_aws\_secret) | Number of days that AWS Secrets Manager will wait before deleting a secret. This value can be set to 0 to force immediate deletion, or to a value between 7 and 30 days to allow for recovery. | `number` | `0` | no |
| <a name="input_store_password_to_secret_manager"></a> [store\_password\_to\_secret\_manager](#input\_store\_password\_to\_secret\_manager) | Specifies whether to store the credentials in AWS secret manager. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_redis_password"></a> [redis\_password](#output\_redis\_password) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
