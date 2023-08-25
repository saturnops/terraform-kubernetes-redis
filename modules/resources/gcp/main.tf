resource "random_password" "redis_password" {
  count   = var.custom_credentials_enabled ? 0 : 1
  length  = 20
  special = false
}

resource "google_secret_manager_secret" "redis_secret" {
  count     = var.store_password_to_secret_manager ? 1 : 0
  project   = var.project_id
  secret_id = format("%s-%s-%s", var.environment, var.name, "redis")

  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "redis_secret" {
  count  = var.store_password_to_secret_manager ? 1 : 0
  secret = google_secret_manager_secret.redis_secret[0].id
  secret_data = var.custom_credentials_enabled ? jsonencode(
    {
      "redis_username" : "root",
      "redis_password" : "${var.custom_credentials_config.password}"

    }) : jsonencode(
    {
      "redis_username" : "root",
      "redis_password" : "${random_password.redis_password[0].result}"
  })
}

output "redis_password" {
  value = var.custom_credentials_enabled ? null : nonsensitive(random_password.redis_password[0].result)
}