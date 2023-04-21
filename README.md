## redis



<br>

## Usage Example

```hcl
module "redis" {
  source                     = "../../"
  redis_config = {
    name                = "skaf"
    values_yaml         = ""
    environment         = "prod"
    architecture        = "replication"
    storage_class_name  = "gp2"
    slave_volume_size   = "10Gi"
    slave_replica_count = 3
    master_volume_size  = "10Gi"  
  }
  grafana_monitoring_enabled  = true
  recovery_window_aws_secret = 0
}

```
Refer [examples](https://github.com/sq-ia/terraform-kubernetes-redis/tree/main/examples/complete) for more details.

## IAM Permissions
The required IAM permissions to create resources from this module can be found [here](https://github.com/sq-ia/terraform-kubernetes-redis/blob/main/IAM.md)

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
| <a name="input_app_version"></a> [app\_version](#input\_app\_version) | Enter app version of application | `string` | `"6.2.7-debian-11-r11"` | no |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | Enter chart version of application | `string` | `"16.13.2"` | no |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Set it to true to create given namespace | `string` | `true` | no |
| <a name="input_grafana_monitoring_enabled"></a> [grafana\_monitoring\_enabled](#input\_grafana\_monitoring\_enabled) | Set true to deploy redis exporter to get metrics in grafana | `bool` | `false` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Enter namespace name | `string` | `"redis"` | no |
| <a name="input_recovery_window_aws_secret"></a> [recovery\_window\_aws\_secret](#input\_recovery\_window\_aws\_secret) | Number of days that AWS Secrets Manager waits before it can delete the secret. This value can be 0 to force deletion without recovery or range from 7 to 30 days. | `number` | `0` | no |
| <a name="input_redis_config"></a> [redis\_config](#input\_redis\_config) | Redis configurations | `any` | <pre>{<br>  "architecture": "replication",<br>  "environment": "",<br>  "master_volume_size": "",<br>  "name": "",<br>  "slave_replica_count": 1,<br>  "slave_volume_size": "",<br>  "storage_class_name": "",<br>  "values_yaml": ""<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_redis_master_endpoint"></a> [redis\_master\_endpoint](#output\_redis\_master\_endpoint) | Redis master pod connection endpoint |
| <a name="output_redis_port"></a> [redis\_port](#output\_redis\_port) | Redis port |
| <a name="output_redis_slave_endpoint"></a> [redis\_slave\_endpoint](#output\_redis\_slave\_endpoint) | Redis slave pod connection endpoint |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->






##           





Please give our GitHub repository a ⭐️ to show your support and increase its visibility.





