# export GOOGLE_APPLICATION_CREDENTIALS=/home/pavlo/terrademo/keys/my-creds.json
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.12.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials)
  project     = var.project
  region      = var.region
}

# Data Lake Bucket
# Ref: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket
resource "google_storage_bucket" "preparer-bucket" {
  name          = var.gcs_bucket_name
  location      = var.location
  force_destroy = true


  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}


# DWH
# Ref: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset
resource "google_bigquery_dataset" "preparer_dataset" {
  dataset_id = var.bq_dataset_name
  location   = var.location
  delete_contents_on_destroy = true
}
resource "google_bigquery_dataset" "sqlmesh__preparer_dataset" {
  dataset_id = "sqlmesh__preparer_dataset"
  location   = var.location
  delete_contents_on_destroy = true
}


#Google Cloud VM
# Ref: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance

# This code is compatible with Terraform 4.25.0 and versions that are backwards compatible to 4.25.0.
# For information about validating this Terraform code, see https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build#format-and-validate-the-configuration

# https://www.youtube.com/watch?v=hyTYC54tx0I
# https://kestra.io/docs/installation/gcp-vm
# https://docs.docker.com/engine/install/ubuntu/
resource "google_compute_instance" "de-zoomcamp-preparer" {
  boot_disk {
    auto_delete = true
    device_name = "de-zoomcamp-preparer"

    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20240319"
      size  = 10
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    goog-ec-src = "vm_add-tf"
  }

  machine_type = "e2-standard-4"
  name         = "de-zoomcamp-preparer"

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    queue_count = 0
    stack_type  = "IPV4_ONLY"
    subnetwork  = "projects/de-zoomcamp-preparer/regions/us-west1/subnetworks/default"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  # service_account {
  #   email  = "183893766071-compute@developer.gserviceaccount.com"
  #   scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  # }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  tags = ["https-server"]
  zone = "us-west1-b"
}
