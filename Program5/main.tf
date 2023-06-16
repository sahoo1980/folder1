provider "google" {
  credentials = "C:\\Users\\lenovo\\Downloads\\my-service-account.json"
  project     = "learned-vault-387908"
  region      = "us-central1"
  zone        = "us-central1-a"
}


resource "google_compute_instance" "instance-1" {
  name         = "instance-1"
  zone         = "us-west4-b"
  machine_type = "e2-medium"
}
