
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.25"
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

  project                = var.project
  region                 = var.region
  zone                   = var.zone
  instance_name          = var.instance_name
  machine_type           = var.machine_type
  labels                 = var.labels
  image                  = var.image
  boot_disk_size         = var.boot_disk_size
  boot_disk_type         = var.boot_disk_type
  metadata               = var.metadata
  network_interfaces     = var.network_interfaces
  service_account_email  = var.service_account_email
  service_account_scopes = var.service_account_scopes
  ssh_public_keys        = var.ssh_public_keys
}

output "instance_self_link" {
  value = module.panw_vm.instance_self_link
}

output "instance_internal_ip" {
  value = module.panw_vm.instance_network_ip
}
