provider "google" {
  credentials = "D:\\Papa\\MyPrograms\\my-key.json"
  project     = "learned-vault-387908"
  region      = "us-central1"
  zone        = "us-central1-a"
}

resource "google_container_cluster" "gke_cluster" {
  name               = "my-webserver-cluster"
  location           = "us-central1"
  initial_node_count = 1
}

resource "google_container_node_pool" "gke_cluster_nodepool" {
  name       = "my-webserver-nodepool"
  cluster    = google_container_cluster.gke_cluster.name
  location   = google_container_cluster.gke_cluster.location
  node_count = 1
  autoscaling {
    min_node_count = 1
    max_node_count = 2
  }
}

resource "kubernetes_deployment" "webserver_deployment" {
  metadata {
    name = "webserver-deployment"
  }

  spec {
    container {
      name  = "webserver"
      image = "gcr.io/learned-vault-387908/my-image/nginx:latest"
      ports {
        container_port = 80
      }
    }
  }
}

resource "kubernetes_service" "webserver_service" {
  metadata {
    name = "webserver-service"
  }
  spec {
    selector = {
      app = "webserver"
    }
    port {
      port        = 80
      target_port = 80
    }
    type = "LoadBalancer"
  }
}
