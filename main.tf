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
  metadata {
    annotations = {}

    name = var.namespace
  }
}

resource "helm_release" "redis" {
  depends_on = [kubernetes_namespace.redis]
  name       = "redis"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "redis"
  namespace  = var.namespace
  version    = var.chart_version
  timeout    = 600

  values = [
    templatefile("${path.module}/helm/values/values.yaml", {
      app_version              = var.app_version,
      redis_password           = random_password.redis_password.result,
      redis_master_volume_size = var.redis_config.master_volume_size,
      architecture             = var.redis_config.architecture,
      slave_replicacount       = var.redis_config.slave_replica_count,
      slave_volume_size        = var.redis_config.slave_volume_size,
      redis_exporter_enabled   = var.enable_grafana_monitoring,
      storage_class_name       = var.redis_config.storage_class_name
    }),
    var.redis_config.values_yaml
  ]
}
