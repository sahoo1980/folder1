provider "google" {
  credentials = "C:\\Users\\lenovo\\Downloads\\my-service-account.json"
  project     = "learned-vault-387908"
  region      = "us-central1"
  zone        = "us-central1-a"
}

#Create NW
resource "google_compute_network" "my-network1" {
  name                    = "my-network-1"
  auto_create_subnetworks = false
}
#Create SubNW
resource "google_compute_subnetwork" "my-subnetwork1" {
  name          = "my-subnetwork-1"
  network       = google_compute_network.my-network1.self_link
  region        = "us-central1"
  ip_cidr_range = "10.0.0.0/24"
}
#Create FW
resource "google_compute_firewall" "my-firewall1" {
  name    = "my-firewall1"
  network = google_compute_network.my-network1.self_link

  allow {
    protocol = "TCP"
    ports    = ["80", "443"]

  }
  source_ranges = ["0.0.0.0/0"]
}
#Create VM
resource "google_compute_instance" "my-instance1" {
  name         = "my-instance1"
  zone         = "us-central1-a"
  machine_type = "e1-standard-1"

  boot_disk {
    initialize_params {
      image = "debiancloud/debian-9"
    }
  }

  #check removing the entry of firewall in state file
  #check using the datasource resource to undelete teh firewall
  network_interface {
    network = google_compute_network.my-network1.self_link
    access_config {
      #nat_ip = 
    }
  }

}
#Print the VM IP and Name
output "VM_Info" {
  value = {
    name       = google_compute_instance.my-instance1.name
    ip_address = google_compute_instance.my-instance1.network_interface[0].access_config[0].nat_ip
  }
}