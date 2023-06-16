provider "google" {
  credentials = "D:\\Papa\\MyPrograms\\my-key.json"
  project     = "learned-vault-387908"
  region      = "us-central1"
  zone        = "us-central1-a"
}

resource "google_monitoring_alert_policy" "cpu_alert" {
  //display_name = "CPUUsageAlert"
  combiner = "OR"

  conditions {
    condition_threshold {
      filter          = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\""
      duration        = "60s"
      comparison      = "COMPARISON_GT"
      threshold_value = 80.0
      trigger {
        count = 1
      }
    }
  }
  notification_channels = [google_monitoring_notification_channel.email_channel.id]
}

resource "google_monitoring_notification_channel" "email_channel" {
  display_name = "Email Channel"
  type         = "email"
  labels = {
    email_address = "bidyutsahoo@gmail.com"
  }

}
