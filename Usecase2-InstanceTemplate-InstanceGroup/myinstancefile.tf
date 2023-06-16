provider "google" {
  credentials = "D:\\Papa\\MyPrograms\\my-key.json"
  project     = "learned-vault-387908"
  region      = "us-central1"
  zone        = "us-central1-a"
}

#Define instance template
resource "google_compute_instance_template" "my-1st-template" {
  name         = "my-1st-template"
  description  = "my first instance template"
  machine_type = "e1-standard-1"
  disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = "ephemeral"
    }
  }
}

#Define instance group
resource "google_compute_instance_group" "my-1st-group" {
  name        = "my-1st-group"
  description = "my first instance group"
  #instances   = 2 # define the no of instances you want to create

  #refer the instance template
  instance_template = google_compute_instance_template.my-1st-template.self_link
  named_port {
    port = "80"
    name = "http"
  }

  named_port {
    name = "https"
    port = "80"
  }
}
