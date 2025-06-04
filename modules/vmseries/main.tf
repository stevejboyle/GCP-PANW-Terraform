
resource "google_compute_instance" "this" {
  name         = var.instance_name
  project      = var.project
  zone         = var.zone
  machine_type = var.machine_type
  can_ip_forward = true
  deletion_protection = false
  enable_display = false

  labels = var.labels

  boot_disk {
    auto_delete = true
    device_name = "${var.instance_name}-boot"

    initialize_params {
      image = var.image
      size  = var.boot_disk_size
      type  = var.boot_disk_type
    }

    mode = "READ_WRITE"
  }

  metadata = var.metadata

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

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  service_account {
    email  = var.service_account_email
    scopes = var.service_account_scopes
  }
}
