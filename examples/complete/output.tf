output "redis_port" {
  value       = "6379"
  description = "The port number on which Redis is running."
}

output "redis_master_endpoint" {
  value       = module.redis.redis_master_endpoint
  description = "The endpoint for the Redis Master Service, which is the primary node in the Redis cluster responsible for handling read-write operations."
}

output "redis_slave_endpoint" {
  value       = module.redis.redis_slave_endpoint
  description = "The endpoint for the Redis Slave Service, which is a secondary node in the Redis cluster responsible for handling read-only operations."
}
