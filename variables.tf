variable "redis_config" {
  type = any
  default = {
    name                = ""
    environment         = ""
    master_volume_size  = ""
    architecture        = "replication"
    slave_replica_count = 1
    slave_volume_size   = ""
    storage_class_name  = ""
    values_yaml         = ""
  }
  description = "Redis configurations"
}

variable "chart_version" {
  type        = string
  default     = "16.13.2"
  description = "Enter chart version of application"
}

variable "app_version" {
  type        = string
  default     = "6.2.7-debian-11-r11"
  description = "Enter app version of application"
}

variable "namespace" {
  type        = string
  default     = "redis"
  description = "Enter namespace name"
}

variable "grafana_monitoring_enabled" {
  type        = bool
  default     = false
  description = "Set true to deploy redis exporter to get metrics in grafana"
}

variable "recovery_window_aws_secret" {
  default     = 0
  type        = number
  description = "Number of days that AWS Secrets Manager waits before it can delete the secret. This value can be 0 to force deletion without recovery or range from 7 to 30 days."
}

variable "create_namespace" {
  type        = string
  description = "Set it to true to create given namespace"
  default     = true
}
