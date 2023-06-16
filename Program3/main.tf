resource "google_project" "my-project" {
    name = "my-project"
    project_id = "flash-audio-793"

  
}

resource "google_app_engine_application" "my-appengine" {
    project = google_project.my-project.project_id
  
}

resource "google_pubsub_subscription" "name" {
  
}

resource "google_service_account" "name" {
  
}

resource "null_resource" "name" {
  
}