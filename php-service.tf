resource "kubernetes_service" "php" {
  metadata {
    name = "php"

    labels = {
      app = "php"
    }
  }

  spec {
    port {
      name     = "phpfpm"
      protocol = "TCP"
      port     = 9000
    }

    selector = {
      app = "php"
    }
  }
}

