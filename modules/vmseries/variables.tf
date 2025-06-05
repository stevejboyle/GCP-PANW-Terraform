
variable "instance_name" { type = string }
variable "machine_type"  { type = string }
variable "zone"          { type = string }
variable "labels"        { type = map(string) }

variable "source_image"  { type = string }
variable "boot_disk_size" { type = number }
variable "boot_disk_type" { type = string }

variable "network_interfaces" {
  type = list(object({
    subnetwork  = string
    stack_type  = string
    queue_count = number
    network_tier = string
  }))
}

variable "metadata" { type = map(string) }
variable "service_account_email"  { type = string }
variable "service_account_scopes" { type = list(string) }
