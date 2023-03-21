output "redis_port" {
  value       = "6379"
  description = "Redis port"
}

output "redis_master_endpoint" {
  value       = module.redis.redis_master_endpoint
  description = "Redis master pod connection endpoint"
}

output "redis_slave_endpoint" {
  value       = module.redis.redis_slave_endpoint
  description = "Redis slave pod connection endpoint"
}
