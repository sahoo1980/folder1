provider "google" {
  credentials = "D:\\Papa\\MyPrograms\\my-key.json"
  project     = "learned-vault-387908"
  region      = "us-central1"
  zone        = "us-central1-a"
}

#Define the existing GKE cluster details
resource "google_container_cluster" "gke_cluster" {
  name               = "my-gke-cluster"
  location           = "us-central1"
  initial_node_count = 1
}

#Define the new nodepool
resource "google_container_node_pool" "gke_nodepool" {
  name       = "my-webserver-pool"
  cluster    = google_container_cluster.gke_cluster.name
  node_count = 1
  /* autoscaling {
    min_node_count = 1
    max_node_count = 2
  }
  management {
    auto_repair  = true
    auto_upgrade = true
  } */

  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials my-gke-cluster --zone us-central1-a --project learned-vault-387908 && kubectl apply -f nginx-deployment.yaml && kubectl apply -f nginx-service.yaml"
  }
}

output "load_balancer_ip" {
  value = google_container_cluster.gke_cluster.endpoint
}