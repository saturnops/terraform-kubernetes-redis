output "redis_endpoints" {
  description = "Redis endpoints in the Kubernetes cluster."
  value = {
    redis_port            = "6379",
    redis_master_endpoint = "redis-master.${var.namespace}.svc.cluster.local",
    redis_slave_endpoint  = "redis-replicas.${var.namespace}.svc.cluster.local"
  }
}

output "redis_credential" {
  description = "Redis credentials used for accessing the database."
  value = var.redis_config.store_password_to_secret_manager ? null : {
    redis_username = "root",
    redis_password = var.custom_credentials_enabled ? var.custom_credentials_config.password : var.redis_password
  }
}
