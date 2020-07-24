resource "kubernetes_service" "mysql" {
  metadata {
    name = "mysql"

    labels = {
      app = "mysql"
    }
  }

  spec {
    port {
      name     = "mysqlport"
      protocol = "TCP"
      port     = 3306
    }

    selector = {
      app = "mysql"
    }
  }
}

