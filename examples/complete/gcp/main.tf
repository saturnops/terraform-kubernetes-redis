locals {
  name        = "redis"
  region      = "us-east-2"
  environment = "prod"
  additional_tags = {
    Owner      = "organization_name"
    Expires    = "Never"
    Department = "Engineering"
  }
  create_namespace                 = true
  namespace                        = "redis"
  store_password_to_secret_manager = true
  custom_credentials_enabled = true
  custom_credentials_config = {
    password = "aajdhgduy3873683dh"
  }
}

module "gcp" {
  source                           = "saturnops/redis/kubernetes//modules/resources/gcp"
  project_id                       = ""
  environment                      = local.environment
  name                             = local.name
  store_password_to_secret_manager = local.store_password_to_secret_manager
  custom_credentials_enabled       = local.custom_credentials_enabled
  custom_credentials_config        = local.custom_credentials_config
}

module "redis" {
  source           = "saturnops/redis/kubernetes"
  create_namespace = local.create_namespace
  namespace        = local.namespace
  redis_config = {
    name                             = local.name
    values_yaml                      = file("./helm/values.yaml")
    environment                      = local.environment
    app_version                      = "6.2.7-debian-11-r11"
    architecture                     = "replication"
    slave_volume_size                = "10Gi"
    master_volume_size               = "10Gi"
    storage_class_name               = "gp3"
    slave_replica_count              = 2
    store_password_to_secret_manager = local.store_password_to_secret_manager
    secret_provider_type             = "aws"
  }
  grafana_monitoring_enabled = true
  custom_credentials_enabled = local.custom_credentials_enabled
  custom_credentials_config = local.custom_credentials_config
  redis_password = local.custom_credentials_enabled ? "" : module.gcp.redis_password
}
