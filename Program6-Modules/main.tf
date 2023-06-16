provider "google" {
  project = "learned-vault-387908"
  region  = "us-central1"
  zone    = "us-central1-a"
}

module "my-web-app" {
  source      = "terraform-google-modules/app-engine/google"
  version     = "8.0.0"
  project     = "learned-vault-387908"
  region      = "us-central1"
  app_yaml    = file("${path.module}/app.yaml")
  service     = "default"
  enviornment = "demos"
}

module "my-database" {
  source          = "terraform-google-modules/cloudsql/google"
  version         = "3.4.0"
  project         = "learned-vault-387908"
  region          = "us-central1"
  database_name   = "my_database"
  database_vesion = "MYSQL_8_0"
}

module "my-cicd-pipeline" {
  source      = "terraform-google-modules/cloud-buils/google"
  version     = "2.1.0"
  project     = "learned-vault-387908"
  region      = "us-central1"
  repo_name   = "my_repo"
  branch_name = "my_branch"

  triggers = {
    github  = true
    webhook = true
  }
}