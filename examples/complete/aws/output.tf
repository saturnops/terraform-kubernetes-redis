output "redis_endpoints" {
  description = "Redis endpoints in the Kubernetes cluster."
  value       = module.redis.redis_endpoints
}

output "redis_credential" {
  description = "Redis credentials used for accessing the database."
  value       = local.store_password_to_secret_manager ? null : module.redis.redis_credential
}
