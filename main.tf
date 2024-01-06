terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 3.72.0"
    }
  }
}

resource "google_compute_instance" "vm" {
  name = "var.instance_name"
  machine_type = "var.machine_type"
  zone = "var.region"
  boot_disk {
    initialize_params {
      image = "var.image"
    }
  }
}