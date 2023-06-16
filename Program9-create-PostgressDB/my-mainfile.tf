provider "google" {
  credentials = "D:\\Papa\\MyPrograms\\my-key.json"
  project     = "learned-vault-387908"
  region      = "us-central1"
  zone        = "us-central1-a"
}

#resource "google_project_service" "cloud_sql_admin_api" {
 # project = "learned-vault-387908"
  #service = "sqladmin.googleapis.com"
#}

resource "google_sql_database_instance" "my-postgress-instance" {
  name             = "my-postgress-instance"
  region           = "us-central1"
  database_version = "POSTGRES_14"
  settings {
    tier = "db-g1-small"
  }
}
