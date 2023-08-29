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
      app_version               = var.redis_config.app_version,
      architecture              = var.redis_config.architecture,
      redis_password            = var.custom_credentials_enabled ? var.custom_credentials_config.password : var.redis_password,
      slave_volume_size         = var.redis_config.slave_volume_size,
      slave_replicacount        = var.redis_config.slave_replica_count,
      storage_class_name        = var.redis_config.storage_class_name,
      redis_exporter_enabled    = var.grafana_monitoring_enabled,
      redis_master_volume_size  = var.redis_config.master_volume_size,
      service_monitor_namespace = var.namespace
    }),
    var.redis_config.values_yaml
  ]
}
