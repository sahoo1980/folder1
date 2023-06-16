provider "google" {
  credentials = "D:\\Papa\\MyPrograms\\my-key.json"
  project     = "learned-vault-387908"
  zone        = "us-central1-a"
}

/* resource "null_resource" "deploy" {
  provisioner "local-exec" {
    command = "kubectl apply -f DeploymentwithHPA.yaml"
  }
  triggers = {
    timestampe = timestamp()
  }
} */

#Define the existing GKE cluster details
resource "google_container_cluster" "gke_cluster" {
  name               = "my-gke-cluster"
  location           = "us-central1"
  initial_node_count = 1
}

resource "google_container_cluster" "my-first-cluster" {
  name               = "my-first-cluster"
  location           = "us-central1"
  initial_node_count = 1
  node_config {
    machine_type = "e2-standard"
    disk_size_gb = 10
  }
}

#Define GKE Cluster Nodepool
resource "google_container_node_pool" "my-first-nodepool" {
  name       = "my-first-nodepool"
  cluster    = google_container_cluster.my-first-cluster.id
  node_count = 1
  version    = "latest"
  autoscaling {
    min_node_count = 1
    max_node_count = 2
  }
  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials my-first-cluster --zone us-central1-a --project learned-vault-387908 && kubectl apply -f DeploymentwithHPA.yaml"
  }

}

output "load_balancer_ip" {
  value = google_container_cluster.my-first-cluster.endpoint
}