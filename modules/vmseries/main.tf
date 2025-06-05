
resource "google_compute_image" "custom_image" {
  name = "${var.environment}-${var.instance_name}-custom-image"
  source_disk = google_compute_disk.boot_disk.self_link
  storage_locations = [var.region]
}

resource "google_compute_disk" "boot_disk" {
  name  = "${var.instance_name}-boot-disk"
  type  = var.boot_disk_type
  zone  = var.zone
  size  = var.boot_disk_size

  source_image = var.source_image

  dynamic "disk_encryption_key" {
    for_each = var.disk_encryption_key_name != null ? [1] : []
    content {
      kms_key_self_link = local.disk_encryption_key_full
    }
  }
}

locals {
  disk_encryption_key_full = (
    var.disk_encryption_key_name != null ?
    "projects/${var.project}/locations/${var.region}/keyRings/${var.disk_encryption_keyring}/cryptoKeys/${var.disk_encryption_key_name}" :
    null
  )
}

resource "google_compute_instance" "this" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  labels       = var.labels

  boot_disk {
    source = google_compute_disk.boot_disk.self_link
  }

  network_interface {
    subnetwork = var.network_interfaces[0].subnetwork
    stack_type = var.network_interfaces[0].stack_type
    queue_count = var.network_interfaces[0].queue_count

    access_config {
      network_tier = var.network_interfaces[0].network_tier
    }
  }

  metadata = var.metadata

  service_account {
    email  = var.service_account_email
    scopes = var.service_account_scopes
  }

  shielded_instance_config {
    enable_secure_boot          = true
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }
}

output "instance_self_link" {
  value = google_compute_instance.this.self_link
}

output "instance_network_ip" {
  value = google_compute_instance.this.network_interface[0].network_ip
}
