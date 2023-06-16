provider "google" {
  project = "learned-vault-387908"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_compute_network" "my-test-nw" {
  name                    = "my-test-nw"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "my-test-subnw" {
  name          = "my-test-subnw"
  region        = "us-central1"
  network       = google_compute_network.my-test-nw.self_link
  ip_cidr_range = "10.10.0.0/16"
}

resource "google_compute_firewall" "my-test-firewall" {
  name        = "my-test-firewall"
  description = "my-test-firewall"
  network     = google_compute_network.my-test-nw.self_link

  allow {
    protocol = "TCP"
    ports    = ["80", "443"]
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance" "my-test-instance" {
  name         = "my-test-instance"
  zone         = "us-central1-a"
  machine_type = "e2-standard"
  boot_disk {
    initialize_params {
      image = "gcr.io/learned-vault-387908/my-folder/my-image:latest"
    }
  }
  network_interface {
    network = google_compute_network.my-test-nw.self_link
    access_config {
    }
  }

  metadata_startup_script = "Hello, I am in!"
}