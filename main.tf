
resource "google_compute_instance" "this" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  labels       = var.labels

  boot_disk {
    initialize_params {
      image = var.source_image
      size  = var.boot_disk_size
      type  = var.boot_disk_type
    }
  }

  network_interface {
    subnetwork  = var.network_interfaces[0].subnetwork
    stack_type  = var.network_interfaces[0].stack_type
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
