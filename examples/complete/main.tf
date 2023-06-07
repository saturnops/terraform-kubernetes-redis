locals {
  name        = "redis"
  region      = "us-east-2"
  environment = "prod"
  additional_tags = {
    Owner      = "organization_name"
    Expires    = "Never"
    Department = "Engineering"
  }
}

module "redis" {
  source = "saturnops/redis/kubernetes"
  redis_config = {
    name                = local.name
    values_yaml         = file("./helm/values.yaml")
    environment         = local.environment
    architecture        = "replication"
    slave_volume_size   = "10Gi"
    master_volume_size  = "10Gi"
    storage_class_name  = "gp3"
    slave_replica_count = 2
  }
  grafana_monitoring_enabled = true
  recovery_window_aws_secret = 0
}
