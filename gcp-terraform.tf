terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 3.72.0"
    }
  }
}

resource "google_compute_instance" "vm" {
  name = "maquina-virtual"
  machine_type = "n1-standard-1"
  zone = "us-central1"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
}