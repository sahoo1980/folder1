provider "google" {
  credentials = "D:\\Papa\\MyPrograms\\my-key.json"
  project     = "learned-vault-387908"
  region      = "us-central1"
  zone        = "us-central1-a"
}

resource "google_sql_database_instance" "postgress_instance" {
    name = "postgress_instance"
    database_version = "POSTGRESS_12"
    settings {
      tier = "db-f1-micro"
    }
    deletion_protection = false
}

resource "google_sql_database" "sql_database" {
name = "sql_database"
instance =   google_sql_database_instance.postgress_instance.name
}

resource "google_sql_user" "sql_user" {
name = "sql_user"  
}