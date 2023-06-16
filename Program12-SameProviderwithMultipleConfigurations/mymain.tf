provider "google" {
  credentials = "D:\\Papa\\MyPrograms\\my-key.json"
  project     = "learned-vault-387908"
  region      = "us-central1"
  zone        = "us-central1-a"
}

provider "google" {
  alias       = "provider1"
  credentials = "D:\\Papa\\MyPrograms\\my-key-2nd.json"
  project     = "banded-earth-246911"
  region      = "us-central1"
  zone        = "us-central1-a"
}

provider "google" {
  alias       = "provider2"
  credentials = "D:\\Papa\\MyPrograms\\my-key-3rd.json"
  project     = "banded-earth-246911"
  region      = "us-central1"
  zone        = "us-central1-a"
}

#createVM in Project1
resource "google_compute_instance" "provider-vm" {
  name         = "provider-vm"
  zone         = "us-central1-a"
  machine_type = "e1-standard-1"
  boot_disk {
    initialize_params {
      image = "gcr.io/learned-vault-387908/my-image/nginx:latest"
    }
  }
  network_interface {
    network = "default"
  }
}

#CreateVM in Project2
resource "google_compute_instance" "provider-vm1" {
  provider     = google.provider1
  name         = "provider-vm1"
  zone         = "us-central1-a"
  machine_type = "e1-standard-1"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian9"
    }
  }
  network_interface {
    network = "default"
  }
}

#CreateVM in Project3
resource "google_compute_instance" "provider-vm2" {
  provider     = google.provider2
  name         = "provider-vm2"
  zone         = "us-central1-a"
  machine_type = "e1-standard-1"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian9"
    }
  }
  network_interface {
    network = "default"
  }
}
