resource "random_password" "redis_password" {
  count   = var.custom_credentials_enabled ? 0 : 1
  length  = 20
  special = false
}

resource "aws_secretsmanager_secret" "redis_password" {
  count                   = var.store_password_to_secret_manager ? 1 : 0
  name                    = format("%s/%s/%s", var.environment, var.name, "redis")
  recovery_window_in_days = var.recovery_window_aws_secret
}

resource "aws_secretsmanager_secret_version" "redis_password" {
  count     = var.store_password_to_secret_manager ? 1 : 0
  secret_id = aws_secretsmanager_secret.redis_password[0].id
  secret_string = var.custom_credentials_enabled ? jsonencode(
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
