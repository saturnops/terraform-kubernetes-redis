variable "store_password_to_secret_manager" {
  type        = bool
  default     = false
  description = "Specifies whether to store the credentials in GCP secret manager."
}

variable "name" {
  description = "Name identifier for module to be added as suffix to resources"
  type        = string
  default     = "test"
}

variable "environment" {
  description = "Environment in which the infrastructure is being deployed (e.g., production, staging, development)"
  type        = string
  default     = "test"
}

variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
  default     = ""
}

variable "resource_group_location" {
  description = "Azure resource group location"
  type        = string
  default     = ""
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