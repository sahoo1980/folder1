provider "google" {
  credentials = "D:\\Papa\\MyPrograms\\my-key.json"
  project     = "learned-vault-387908"
  region      = "us-central1"
  zone        = "us-central1-a"
}

resource "google_compute_network" "my-nw-vpc" {
  name                    = "my-nw-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "my-subnw" {
  name          = "my-subnw"
  region        = "us-central1"
  network       = google_compute_network.my-nw-vpc.self_link
  ip_cidr_range = "10.0.0.0/16"
}

resource "google_compute_firewall" "my-nw-firewall" {
  name    = "my-nw-firewall"
  network = google_compute_network.my-nw-vpc.self_link
  allow {
    protocol = "TCP"
    ports    = ["80", "8443"]
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_route" "my-route" {
  name             = "my-route"
  network          = google_compute_network.my-nw-vpc.self_link
  dest_range       = "0.0.0.0/0"
  next_hop_gateway = "default_internet_gateway"
  priority         = 1000
  tags             = ["my-tag"]
}

