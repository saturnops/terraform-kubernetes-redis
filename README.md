## Redis Terraform Module



<br>
This module allows users to customize the deployment by providing various input variables. Users can specify the name and environment of the Redis deployment, the chart and app version, the namespace in which the Redis deployment will be created, and whether to enable Grafana monitoring. The module also allows users to set the recovery window for the AWS Secrets Manager that is used to store the Redis password.
<br><br>
This module creates a Redis <strong>master</strong> and one or more Redis <strong>slaves</strong>, based on the specified architecture. It sets up Kubernetes services for the Redis master and slave deployments and exposes these services as <strong>endpoints</strong> for connecting to the Redis database. Users can retrieve these endpoints using the module's outputs. <br>

## Supported Versions :

|  Redis Helm Chart Version    |     K8s supported version   |  
| :-----:                       |         :---                |
| **16.13.2**                     |    **1.23,1.24,1.25,1.26,1.27**           |

## Usage Example

```hcl
module "redis" {
  source                = "saturnops/redis/kubernetes"
  redis_config = {
    name                             = "redis"
    values_yaml                      = ""
    environment                      = "prod"
    architecture                     = "replication"
    slave_volume_size                = "10Gi"
    master_volume_size               = "10Gi"
    storage_class_name               = "gp3"
    slave_replica_count              = 2
    store_password_to_secret_manager = true
  }
  grafana_monitoring_enabled = true
  recovery_window_aws_secret = 0
  custom_credentials_enabled = true
  custom_credentials_config = {
    password = "aajdhgduy3873683dh"
  }
}

```
Refer [examples](https://github.com/saturnops/terraform-kubernetes-redis/tree/main/examples/complete) for more details.

## IAM Permissions
The required IAM permissions to create resources from this module can be found [here](https://github.com/saturnops/terraform-kubernetes-redis/blob/main/IAM.md)

## Notes
  1. In order to enable the exporter, it is required to deploy Prometheus/Grafana first.
  2. The exporter is a tool that extracts metrics data from an application or system and makes it available to be scraped by Prometheus.
  3. Prometheus is a monitoring system that collects metrics data from various sources, including exporters, and stores it in a time-series database.
  4. Grafana is a data visualization and dashboard tool that works with Prometheus and other data sources to display the collected metrics in a user-friendly way.
  5. To deploy Prometheus/Grafana, please follow the installation instructions for each tool in their respective documentation.
  6. Once Prometheus and Grafana are deployed, the exporter can be configured to scrape metrics data from your application or system and send it to Prometheus.
  7. Finally, you can use Grafana to create custom dashboards and visualize the metrics data collected by Prometheus.
  8. This module is compatible with EKS version 1.23, which is great news for users deploying the module on an EKS cluster running that version. Review the module's documentation, meet specific configuration requirements, and test thoroughly after deployment to ensure everything works as expected.
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret.redis_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.redis_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [helm_release.redis](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.redis](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [random_password.redis_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_version"></a> [app\_version](#input\_app\_version) | Version of the Redis application that will be deployed. | `string` | `"6.2.7-debian-11-r11"` | no |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | Version of the chart for the Redis application that will be deployed. | `string` | `"16.13.2"` | no |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Specify whether or not to create the namespace if it does not already exist. Set it to true to create the namespace. | `string` | `true` | no |
| <a name="input_custom_credentials_config"></a> [custom\_credentials\_config](#input\_custom\_credentials\_config) | Specify the configuration settings for Redis to pass custom credentials during creation. | `any` | <pre>{<br>  "password": ""<br>}</pre> | no |
| <a name="input_custom_credentials_enabled"></a> [custom\_credentials\_enabled](#input\_custom\_credentials\_enabled) | Specifies whether to enable custom credentials for Redis. | `bool` | `false` | no |
| <a name="input_grafana_monitoring_enabled"></a> [grafana\_monitoring\_enabled](#input\_grafana\_monitoring\_enabled) | Specify whether or not to deploy Redis exporter to collect Redis metrics for monitoring in Grafana. | `bool` | `false` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace where the Redis resources will be deployed. | `string` | `"redis"` | no |
| <a name="input_recovery_window_aws_secret"></a> [recovery\_window\_aws\_secret](#input\_recovery\_window\_aws\_secret) | Number of days that AWS Secrets Manager will wait before it can delete the secret. The value can be 0 to force deletion without recovery, or a range from 7 to 30 days. | `number` | `0` | no |
| <a name="input_redis_config"></a> [redis\_config](#input\_redis\_config) | Specify the configuration settings for Redis, including the name, environment, storage options, replication settings, store password to secret manager and custom YAML values. | `any` | <pre>{<br>  "architecture": "replication",<br>  "environment": "",<br>  "master_volume_size": "",<br>  "name": "",<br>  "slave_replica_count": 1,<br>  "slave_volume_size": "",<br>  "storage_class_name": "",<br>  "store_password_to_secret_manager": "",<br>  "values_yaml": ""<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_redis_credential"></a> [redis\_credential](#output\_redis\_credential) | Redis credentials used for accessing the database. |
| <a name="output_redis_endpoints"></a> [redis\_endpoints](#output\_redis\_endpoints) | Redis endpoints in the Kubernetes cluster. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->






##           





Please give our GitHub repository a ⭐️ to show your support and increase its visibility.





