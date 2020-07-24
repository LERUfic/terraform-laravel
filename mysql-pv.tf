resource "kubernetes_persistent_volume" "mysql_pv_volume" {
  metadata {
    name = "mysql-pv-volume"

    labels = {
      app = "mysql"

      type = "local"
    }
  }

  spec {
    capacity = {
      storage = "5Gi"
    }

    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      host_path {
        path = "/mnt/data"
      }
    }
    storage_class_name = "manual"
  }
}

resource "kubernetes_persistent_volume_claim" "mysql_pv_claim" {
  metadata {
    name = "mysql-pv-claim"

    labels = {
      app = "mysql"
    }
  }

  spec {
    access_modes = ["ReadWriteMany"]

    resources {
      requests = {
        storage = "5Gi"
      }
    }

    storage_class_name = "manual"
  }
  depends_on = [
    kubernetes_persistent_volume.mysql_pv_volume
  ]
}

