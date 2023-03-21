locals {
  region      = "us-east-2"
  name        = "skaf"
  environment = "prod"
}

module "redis" {
  source                     = "../../"
  enable_grafana_monitoring  = true
  recovery_window_aws_secret = 30
  redis_config = {
    name                = local.name
    environment         = local.environment
    master_volume_size  = "10Gi"
    architecture        = "replication"
    slave_replica_count = 3
    slave_volume_size   = "10Gi"
    storage_class_name  = "gp2"
    values_yaml         = file("./helm/values.yaml")
  }
}
