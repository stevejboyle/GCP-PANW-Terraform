terraform {
  required_version = ">= 1.3.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

module "panw_vm" {
  source = "../../../modules/vmseries"

  instance_name          = var.instance_name
  machine_type           = var.machine_type
  zone                   = var.zone
  labels                 = var.labels
  source_image           = var.source_image
  boot_disk_size         = var.boot_disk_size
  boot_disk_type         = var.boot_disk_type
  network_interfaces     = var.network_interfaces
  metadata               = var.metadata
  service_account_email  = var.service_account_email
  service_account_scopes = var.service_account_scopes
}
