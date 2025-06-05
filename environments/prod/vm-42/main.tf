
provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

module "panw_vm" {
  source                  = "../../../modules/vmseries"
  project                 = var.project
  region                  = var.region
  zone                    = var.zone
  instance_name           = var.instance_name
  machine_type            = var.machine_type
  boot_disk_size          = var.boot_disk_size
  boot_disk_type          = var.boot_disk_type
  source_image            = var.source_image
  network_interfaces      = var.network_interfaces
  labels                  = var.labels
  metadata                = var.metadata
  service_account_email   = var.service_account_email
  service_account_scopes  = var.service_account_scopes
  ssh_key_content         = var.ssh_key_content
  disk_encryption_key_name = var.disk_encryption_key_name
  disk_encryption_keyring  = var.disk_encryption_keyring
  environment             = var.environment
}
