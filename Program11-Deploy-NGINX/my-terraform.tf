#Define Provider
provider "google" {
    credentials = "D:\\Papa\\MyPrograms\\my-key.json"
    project = "learned-vault-387908"
    region = "us-central1"
    zone = "us-central1-a"
}
#Define GKE Cluster
resource "google_container_cluster" "my-first-cluster" {
    name = "my-first-cluster"
    location = "us-central1"
    initial_node_count = 1
    node_config {
      machine_type = "e2-standard"
      disk_size_gb = 10
    } 
}
#Define GKE Cluster Nodepool
resource "google_container_node_pool" "my-first-nodepool" {
    name = "my-first-nodepool"
    cluster = google_container_cluster.my-first-cluster
    node_count = 1
    version = "latest"
    autoscaling {
      min_node_count = 1
      max_node_count = 2
    }
}
#Define the yaml file path
resource "kubernetes_manifest" "my-first-pod" {
    manifest = jsondecode(file("D:\\Papa\\MyPrograms\\My-Terraform\\Program11-Deploy-NGINX\\pod.yaml"))
}
resource "kubernetes_manifest" "my-first-service" {
    manifest = "D:\\Papa\\MyPrograms\\My-Terraform\\Program11-Deploy-NGINX\\service.yaml" 
}
resource "kubernetes_manifest" "my-first-deployment" {
    manifest = "D:\\Papa\\MyPrograms\\My-Terraform\\Program11-Deploy-NGINX\\deployment.yaml" 
}

