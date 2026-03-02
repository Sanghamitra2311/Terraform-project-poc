terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0" # Always good practice to pin a major version
    }
  }
}

provider "google" {
  project = "ornate-node-483516-e3"
  region  = "us-central1" # Feel free to change this to your target region (e.g., asia-south1)
  zone    = "us-central1-a"
}

# A simple data block just to test the connection
# data "google_project" "project" {}

# The provider block you already have should be above this...

# resource "google_storage_bucket" "my_first_bucket" {
#   name          = "ornate-node-483516-e3-test-bucket"
#   location      = "US" # You can change this to "ASIA-SOUTH1" for Mumbai
#   force_destroy = true

#   uniform_bucket_level_access = true

#   labels = {
#     environment = "dev"
#     managed_by  = "terraform"
#   }
# }

# output "project_number" {
#   value = data.google_project.project.number
# }

#
################ VM CREATION USING LOOP ###############

resource "google_compute_instance" "my_vms" {
  count        = var.instance_count
  name         = "dev-vm-${count.index + 1}"
  machine_type = var.machine_type
  zone         = var.zone

  scheduling {
    provisioning_model          = "SPOT"
    preemptible                 = true
    automatic_restart           = false
    instance_termination_action = "DELETE" # Tells GCP to delete, not just stop

    #Google Cloud recently introduced a feature specifically for this that handles the cleanup slightly better than a startup script. You can tell GCP to physically delete the VM after a certain amount of time using the max_run_duration block:

    max_run_duration {
      seconds = 600 # 10 minutes
    }
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  #   # THIS IS THE NEW BLOCK
  #   metadata_startup_script = <<-EOF
  #     #!/bin/bash
  #     echo "Initiating auto-shutdown sequence..."
  #     # The -h tells it to halt/power off, and +10 means in 10 minutes
  #     shutdown -h +10
  #   EOF
}
