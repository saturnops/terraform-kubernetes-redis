resource "random_password" "redis_password" {
  count   = var.custom_credentials_enabled ? 0 : 1
  length  = 20
  special = false
}

resource "aws_secretsmanager_secret" "redis_password" {
  count                   = var.redis_config.store_password_to_secret_manager ? 1 : 0
  name                    = format("%s/%s/%s", var.redis_config.environment, var.redis_config.name, "redis")
  recovery_window_in_days = var.recovery_window_aws_secret
}

resource "aws_secretsmanager_secret_version" "redis_password" {
  count     = var.redis_config.store_password_to_secret_manager ? 1 : 0
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

resource "kubernetes_namespace" "redis" {
  count = var.create_namespace ? 1 : 0
  metadata {
    annotations = {}
    name        = var.namespace
  }
}

resource "helm_release" "redis" {
  depends_on = [kubernetes_namespace.redis]
  name       = "redis"
  chart      = "redis"
  version    = var.chart_version
  timeout    = 600
  namespace  = var.namespace
  repository = "https://charts.bitnami.com/bitnami"
  values = [
    templatefile("${path.module}/helm/values/values.yaml", {
      app_version              = var.app_version,
      architecture             = var.redis_config.architecture,
      redis_password           = var.custom_credentials_enabled ? var.custom_credentials_config.password : random_password.redis_password[0].result,
      slave_volume_size        = var.redis_config.slave_volume_size,
      slave_replicacount       = var.redis_config.slave_replica_count,
      storage_class_name       = var.redis_config.storage_class_name,
      redis_exporter_enabled   = var.grafana_monitoring_enabled,
      redis_master_volume_size = var.redis_config.master_volume_size
    }),
    var.redis_config.values_yaml
  ]
}
