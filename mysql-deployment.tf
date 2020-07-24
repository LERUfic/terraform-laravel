resource "kubernetes_stateful_set" "mysql" {
  metadata {
    name      = "mysql"
    namespace = "default"
  }

  spec {
    replicas     = 1
    service_name = "mysql"

    selector {
      match_labels = {
        app = "mysql"
      }
    }

    template {
      metadata {
        labels = {
          app = "mysql"
        }
      }

      spec {
        volume {
          name = "mysqlpv"

          persistent_volume_claim {
            claim_name = "mysql-pv-claim"
          }
        }

        container {
          name  = "mysql"
          image = "mysql:5.7"

          port {
            name           = "port1"
            container_port = 3306
            protocol       = "TCP"
          }

          env {
            name  = "MYSQL_DATABASE"
            value = "postgres"
          }

          env {
            name  = "MYSQL_ROOT_PASSWORD"
            value = "l3ru123!"
          }
        }

        restart_policy = "Always"
      }
    }
  }
  depends_on = [
    kubernetes_persistent_volume_claim.mysql_pv_claim
  ]
}

