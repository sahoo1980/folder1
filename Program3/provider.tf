terraform {
  required_version = ">=1.4.0"
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "35.0.0"
    }
  }
}