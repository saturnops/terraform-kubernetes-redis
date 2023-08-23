# gcp

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_secret_manager_secret.redis_secret](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret) | resource |
| [google_secret_manager_secret_version.redis_secret](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_version) | resource |
| [random_password.redis_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_credentials_config"></a> [custom\_credentials\_config](#input\_custom\_credentials\_config) | Specify the configuration settings for Redis to pass custom credentials during creation. | `any` | <pre>{<br>  "password": ""<br>}</pre> | no |
| <a name="input_custom_credentials_enabled"></a> [custom\_credentials\_enabled](#input\_custom\_credentials\_enabled) | Specifies whether to enable custom credentials for Redis. | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment in which the infrastructure is being deployed (e.g., production, staging, development) | `string` | `"test"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name identifier for module to be added as suffix to resources | `string` | `"test"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Google Cloud project ID | `string` | `""` | no |
| <a name="input_store_password_to_secret_manager"></a> [store\_password\_to\_secret\_manager](#input\_store\_password\_to\_secret\_manager) | Specifies whether to store the credentials in GCP secret manager. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_redis_password"></a> [redis\_password](#output\_redis\_password) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
