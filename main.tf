resource "random_password" "redis_password" {
  length  = 20
  special = false
}

resource "aws_secretsmanager_secret" "redis_password" {
  name                    = format("%s/%s/%s", var.redis_config.environment, var.redis_config.name, "redis")
  recovery_window_in_days = var.recovery_window_aws_secret
}

resource "aws_secretsmanager_secret_version" "redis_password" {
  secret_id     = aws_secretsmanager_secret.redis_password.id
  secret_string = <<EOF
   {
    "username": "root",
    "password": "${random_password.redis_password.result}"
   }
EOF
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
      redis_password           = random_password.redis_password.result,
      slave_volume_size        = var.redis_config.slave_volume_size,
      slave_replicacount       = var.redis_config.slave_replica_count,
      storage_class_name       = var.redis_config.storage_class_name,
      redis_exporter_enabled   = var.grafana_monitoring_enabled,
      redis_master_volume_size = var.redis_config.master_volume_size
    }),
    var.redis_config.values_yaml
  ]
}
