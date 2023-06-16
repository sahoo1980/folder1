provider "google" {
  credentials = "D:\\Papa\\MyPrograms\\my-key.json"
  project     = "learned-vault-387908"
  region      = "us-central1"
  zone        = "us-central1-a"
}

resource "google_monitoring_alert_policy" "name" {
  
}

resource "google_monitoring_notification_channel" "name" {

  
}

resource "google_monitoring_uptime_check_config" "name" {
  
}

resource "google_monitoring_dashboard" "name" {
  
}