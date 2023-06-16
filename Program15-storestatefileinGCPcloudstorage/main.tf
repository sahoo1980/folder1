terraform {
  backend "gcs" {
    #bucket      = "my-nw-remotestate"
    bucket      = "artifacts.learned-vault-387908.appspot.com"
    prefix      = "terraform/state"
    credentials = "D:\\Papa\\MyPrograms\\my-key.json"
  }
  required_version = ">=1.4.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = "D:\\Papa\\MyPrograms\\my-key.json"
  project     = "learned-vault-387908"
  region      = "us-central1"
  zone        = "us-central1-a"
}

resource "google_compute_network" "my-nw-remotestate" {
  name                    = "my-nw-remotestate"
  auto_create_subnetworks = false
}