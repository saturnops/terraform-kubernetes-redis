variable "redis_config" {
  type = any
  default = {
    name                             = ""
    environment                      = ""
    master_volume_size               = ""
    architecture                     = "replication"
    slave_replica_count              = 1
    slave_volume_size                = ""
    storage_class_name               = ""
    store_password_to_secret_manager = ""
    values_yaml                      = ""
  }
  description = "Specify the configuration settings for Redis, including the name, environment, storage options, replication settings, store password to secret manager and custom YAML values."
}

variable "chart_version" {
  type        = string
  default     = "16.13.2"
  description = "Version of the chart for the Redis application that will be deployed."
}

variable "app_version" {
  type        = string
  default     = "6.2.7-debian-11-r11"
  description = "Version of the Redis application that will be deployed."
}

variable "namespace" {
  type        = string
  default     = "redis"
  description = "Namespace where the Redis resources will be deployed."
}

variable "grafana_monitoring_enabled" {
  type        = bool
  default     = false
  description = "Specify whether or not to deploy Redis exporter to collect Redis metrics for monitoring in Grafana."
}

variable "recovery_window_aws_secret" {
  default     = 0
  type        = number
  description = "Number of days that AWS Secrets Manager will wait before it can delete the secret. The value can be 0 to force deletion without recovery, or a range from 7 to 30 days."
}

variable "create_namespace" {
  type        = string
  description = "Specify whether or not to create the namespace if it does not already exist. Set it to true to create the namespace."
  default     = true
}

variable "custom_credentials_enabled" {
  type        = bool
  default     = false
  description = "Specifies whether to enable custom credentials for Redis."
}

variable "custom_credentials_config" {
  type = any
  default = {
    password = ""
  }
  description = "Specify the configuration settings for Redis to pass custom credentials during creation."
}
