resource "kubernetes_service" "nginx" {
  metadata {
    name = "nginx"

    labels = {
      app = "nginx"
    }
  }

  spec {
    port {
      name      = "httpport"
      protocol  = "TCP"
      port      = 80
      node_port = 30080
    }

    port {
      name      = "httpsport"
      protocol  = "TCP"
      port      = 443
      node_port = 30443
    }

    selector = {
      app = "nginx"
    }

    type = "NodePort"
  }
}

