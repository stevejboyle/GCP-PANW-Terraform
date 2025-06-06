resource "google_compute_disk" "boot_disk" {
  name  = "${var.instance_name}-boot-disk"
  type  = var.boot_disk_type
  zone  = var.zone
  size  = var.boot_disk_size
  image = var.source_image

  disk_encryption_key {
    kms_key_self_link = local.disk_encryption_key_full
  }
}

resource "google_compute_instance" "this" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  labels       = var.labels

  boot_disk {
    source = google_compute_disk.boot_disk.id
  }

  dynamic "network_interface" {
    for_each = var.network_interfaces
    content {
      subnetwork  = network_interface.value.subnetwork
      stack_type  = network_interface.value.stack_type
      queue_count = network_interface.value.queue_count

      dynamic "access_config" {
        for_each = network_interface.value.has_public ? [1] : []
        content {
          network_tier = network_interface.value.network_tier
        }
      }
    }
  }

  metadata = var.metadata

  service_account {
    email  = var.service_account_email
    scopes = var.service_account_scopes
  }

  lifecycle {
    ignore_changes = [
      metadata["ssh-keys"],
    ]
  }
}

locals {
  disk_encryption_key_full = (
    var.disk_encryption_key_name != null ?
    "projects/${var.project}/locations/${var.region}/keyRings/${var.disk_encryption_keyring}/cryptoKeys/${var.disk_encryption_key_name}" :
    null
  )
}

output "instance_self_link" {
  value = google_compute_instance.this.self_link
}

output "instance_network_ip" {
  value = google_compute_instance.this.network_interface[0].network_ip
}
