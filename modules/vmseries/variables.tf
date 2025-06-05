
variable "instance_name" { type = string }
variable "machine_type" { type = string }
variable "zone" { type = string }
variable "labels" { type = map(string) }
variable "source_image" { type = string }
variable "boot_disk_size" { type = number }
variable "boot_disk_type" { type = string }
variable "network_interfaces" { type = list(any) }
variable "metadata" { type = map(string) }
variable "service_account_email" { type = string }
variable "service_account_scopes" { type = list(string) }
variable "project" { type = string }
variable "region" { type = string }
variable "ssh_key_content" { type = string }
variable "disk_encryption_key_name" {
  type    = string
  default = null
}
variable "disk_encryption_keyring" {
  type    = string
  default = "US-East-1-KeyRing"
}
variable "environment" { type = string }
