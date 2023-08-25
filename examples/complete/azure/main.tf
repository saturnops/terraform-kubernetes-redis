locals {
  name        = "redis"
  region      = "eastus"
  environment = "prod"
  additional_tags = {
    Owner      = "organization_name"
    Expires    = "Never"
    Department = "Engineering"
  }
  store_password_to_secret_manager = true
  custom_credentials_enabled       = true
  custom_credentials_config = {
    password = "aajdhgduy3873683dh"
  }
}

module "azure" {
  source                           = "saturnops/redis/kubernetes//modules/resources/azure"
  resource_group_name              = "prod-skaf-rg"
  resource_group_location          = local.region
  environment                      = local.environment
  name                             = local.name
  store_password_to_secret_manager = local.store_password_to_secret_manager
  custom_credentials_enabled       = local.custom_credentials_enabled
  custom_credentials_config        = local.custom_credentials_config
}

module "redis" {
  source = "saturnops/redis/kubernetes"
  redis_config = {
    name                             = local.name
    values_yaml                      = file("./helm/values.yaml")
    environment                      = local.environment
    architecture                     = "replication"
    slave_volume_size                = "10Gi"
    master_volume_size               = "10Gi"
    storage_class_name               = "infra-service-sc"
    slave_replica_count              = 2
    store_password_to_secret_manager = local.store_password_to_secret_manager
    secret_provider_type             = "azure"
  }
  grafana_monitoring_enabled = true
  custom_credentials_enabled = local.custom_credentials_enabled
  custom_credentials_config  = local.custom_credentials_config
  redis_password             = local.custom_credentials_enabled ? "" : module.azure.redis_password
}
