resource "kubernetes_deployment" "php" {
  metadata {
    name      = "php"
    namespace = "default"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "php"
      }
    }

    template {
      metadata {
        labels = {
          app = "php"
        }
      }

      spec {
        container {
          name  = "php"
          image = "lerufic/laravel:development"

          port {
            name           = "port1"
            container_port = 9000
            protocol       = "TCP"
          }
        }

        restart_policy = "Always"
      }
    }
  }
  depends_on = [
    kubernetes_stateful_set.mysql
  ]
}

