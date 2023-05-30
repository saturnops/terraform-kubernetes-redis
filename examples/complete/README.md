## Redis Terraform Module Example


<br>
This example will be very useful for users who are new to a module and want to quickly learn how to use it. By reviewing the examples, users can gain a better understanding of how the module works, what features it supports, and how to customize it to their specific needs.
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_redis"></a> [redis](#module\_redis) | saturnops/redis/kubernetes.git | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_redis_master_endpoint"></a> [redis\_master\_endpoint](#output\_redis\_master\_endpoint) | The endpoint for the Redis Master Service, which is the primary node in the Redis cluster responsible for handling read-write operations. |
| <a name="output_redis_port"></a> [redis\_port](#output\_redis\_port) | The port number on which Redis is running. |
| <a name="output_redis_slave_endpoint"></a> [redis\_slave\_endpoint](#output\_redis\_slave\_endpoint) | The endpoint for the Redis Slave Service, which is a secondary node in the Redis cluster responsible for handling read-only operations. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
