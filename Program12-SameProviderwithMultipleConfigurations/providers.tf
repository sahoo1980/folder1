terraform {
  backend "gcs" {
    #bucket      = "my-nw-remotestate"
    bucket      = "artifacts.learned-vault-387908.appspot.com"
    prefix      = "terraform/state/$(shell date +%Y%m%d-%H%M%S).tfstate"
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