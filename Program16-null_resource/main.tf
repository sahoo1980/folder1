terraform {
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

resource "null_resource" "my-null-resource" {
  triggers = {
    file_content = "${filesha256("script.sh")}"
  }
  provisioner "local-exec" {
    command = "hi..this is local"
  }
  provisioner "remote-exec" {
    inline = [
      "echo running at remote", "echo file checksum: $(triggers.file_content)"
    ]
  }
}

