
output "instance_self_link" {
  value = google_compute_instance.this.self_link
}

output "instance_network_ip" {
  value = google_compute_instance.this.network_interface[0].network_ip
}
