provider "google" {
  project = "learned-vault-387908"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_compute_network" "my-network1" {
  name                    = "my-network1"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "my-subnetwork1" {
  name          = "my-subnetwork1"
  network       = google_compute_network.my-network1.id
  ip_cidr_range = "10.0.0.0/24"
}

resource "google_compute_instance" "my-vm1" {
  name         = "my-vm1"
  zone         = "us-central1-a"
  machine_type = "n1-standard-1"

  network_interface {
    network = google_compute_network.my-network1.id
    access_config {
      nat_ip = "ephemeral"
    }
  }

  boot_disk {
    initialize_params {
      image = "debiancloud/debian-10"
    }
  }

}