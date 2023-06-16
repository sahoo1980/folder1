resource "google_compute_instance_template" "my-new-template" {
    name = "my-new-template"
    machine_type = "e1-standard-1"
    disk {
      initialize_params{
        image = "debian-cloud/debian9"
      }
    }

    network_interface {
      network = "default"
      nat_ip = ephemeral
    }
}

resource "google_compute_instance_group_manager" "my-new-instancegroup_manager" {
  name = "my-new-instancegroup"
    zone = "us-central1-a"
    base_instance_name = "my-instance"
    target_size = 2
    version {
      instance_template = google_compute_instance_template.my-new-template.self_link
    }
    
    auto_healing_policies {
      
    }
}

resource "google_compute_http_health_check" "my-http-healthcheckup" {
    name = "my-http-healthcheckup"
    request_path = "/"
    check_interval_sec = 10
    timeout_sec = 5
    healthy_threshold = 3
    unhealthy_threshold = 2
}

