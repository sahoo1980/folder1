provider "google" {
  #project = var.projectId
  project = "learned-vault-387908"
  #region  = var.
  region = "us-cnetral1"
  #zone    = var.projectZone
  zone = "us-central1-a"
}

resource "google_compute_network" "my-network" {
  name                    = "my-test-network1"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "my-subnetwork" {
  name          = "my-test-subnetwork1"
  network       = google_compute_network.my-network.self_link
  ip_cidr_range = "10.0.0.0/24"
}

resource "google_container_cluster" "primary-cluster" {
  name = "my-gke-cluster"
  #location           = "US"
  location = "us-cnetral1"

  initial_node_count = 2
  node_config {
    machine_type = "n1-standard-1"
    disk_size_gb = 10
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute"
    ]
  }
}