output "redis_port" {
  value       = "6379"
  description = "Redis port"
}

output "redis_master_endpoint" {
  value       = "redis-master.${var.namespace}.svc.cluster.local"
  description = "Redis master pod connection endpoint"
}

output "redis_slave_endpoint" {
  value       = "redis-replicas.${var.namespace}.svc.cluster.local"
  description = "Redis slave pod connection endpoint"
}
