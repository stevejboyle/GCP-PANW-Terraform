
project = "sboyle-panw-test"
region  = "us-east1"
zone    = "us-east1-b"
instance_name = "prod-vm-01"
machine_type  = "c2-standard-16"
labels = {
  environment = "prod"
  instance    = "vm-01"
}
image = "projects/mpi-paloaltonetworksgcp-public/global/images/vmseries-flex-byol-1123h3"
boot_disk_size = 60
boot_disk_type = "pd-ssd"
metadata = {
  mgmt-interface-swap = "enable"
  serial-port-enable  = "true"
}
network_interfaces = [
  {
    subnetwork = "projects/sboyle-panw-test/regions/us-east1/subnetworks/outside"
    stack_type = "IPV4_ONLY"
    queue_count = 0
    has_public = true
    network_tier = "PREMIUM"
  },
  {
    subnetwork = "projects/sboyle-panw-test/regions/us-east1/subnetworks/mgmt-sn"
    stack_type = "IPV4_ONLY"
    queue_count = 0
    has_public = true
    network_tier = "PREMIUM"
  },
  {
    subnetwork = "projects/sboyle-panw-test/regions/us-east1/subnetworks/inside"
    stack_type = "IPV4_ONLY"
    queue_count = 0
    has_public = false
    network_tier = ""
  }
]
service_account_email = "283940809712-compute@developer.gserviceaccount.com"
service_account_scopes = [
  "https://www.googleapis.com/auth/cloud.useraccounts.readonly",
  "https://www.googleapis.com/auth/compute.readonly",
  "https://www.googleapis.com/auth/devstorage.read_only",
  "https://www.googleapis.com/auth/logging.write",
  "https://www.googleapis.com/auth/monitoring.write"
]

ssh_public_keys = [
  "admin:${file("${path.root}/../../../../gcp.key.pub")} admin"
]
