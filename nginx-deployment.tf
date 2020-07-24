resource "kubernetes_deployment" "nginx" {
  metadata {
    name      = "nginx"
    namespace = "default"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        volume {
          name = "nginx-volume"

          config_map {
            name = "nginx-config"
          }
        }

        container {
          name  = "nginx"
          image = "nginx:latest"

          port {
            name           = "port1"
            container_port = 80
            protocol       = "TCP"
          }

          port {
            name           = "port2"
            container_port = 443
            protocol       = "TCP"
          }

          volume_mount {
            name       = "nginx-volume"
            mount_path = "/etc/nginx/conf.d"
          }
        }

        restart_policy = "Always"
      }
    }
  }

  depends_on = [
    kubernetes_stateful_set.mysql,
    kubernetes_deployment.php,
    kubernetes_config_map.nginx_config
  ]
}

