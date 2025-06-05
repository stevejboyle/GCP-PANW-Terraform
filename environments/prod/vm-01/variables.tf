
variable "project" {
  type        = string
  description = "GCP project ID"
  validation {
    condition     = length(var.project) > 0
    error_message = "Project ID cannot be empty."
  }
}

variable "region" {
  type        = string
  description = "GCP region"
  validation {
    condition     = can(regex("^([a-z]+)-([a-z]+)[0-9]$", var.region))
    error_message = "Region must be like 'us-east1'."
  }
}

variable "zone" {
  type        = string
  description = "GCP zone"
  validation {
    condition     = can(regex("^([a-z]+)-([a-z]+)[0-9]-[a-z]$", var.zone))
    error_message = "Zone must be like 'us-east1-b'."
  }
}

variable "instance_name" {
  type        = string
  description = "Name of the VM instance"
  validation {
    condition     = length(var.instance_name) > 0
    error_message = "Instance name cannot be empty."
  }
}

variable "machine_type" {
  type        = string
  description = "Machine type (e.g. c2-standard-16)"
}

variable "labels" {
  type        = map(string)
  description = "Labels to apply"
}

variable "image" {
  type        = string
  description = "Boot disk image resource"
}

variable "boot_disk_size" {
  type        = number
  description = "Boot disk size in GB"
  validation {
    condition     = var.boot_disk_size >= 10 && var.boot_disk_size <= 500
    error_message = "Boot disk size must be between 10 and 500 GB."
  }
}

variable "boot_disk_type" {
  type        = string
  description = "Boot disk type (pd-ssd, pd-standard)"
  validation {
    condition     = contains(["pd-ssd", "pd-standard", "pd-balanced"], var.boot_disk_type)
    error_message = "Boot disk type must be one of: pd-ssd, pd-standard, pd-balanced."
  }
}

variable "metadata" {
  type        = map(string)
  description = "Instance metadata (e.g. ssh-keys)"
}

variable "network_interfaces" {
  type = list(object({
    subnetwork    = string
    stack_type    = string
    queue_count   = number
    has_public    = bool
    network_tier  = string
  }))
  description = "List of network interface configs"
  validation {
    condition = length(var.network_interfaces) >= 1
    error_message = "At least one network interface must be defined."
  }
}

variable "service_account_email" {
  type        = string
  description = "Service account to attach"
  validation {
    condition     = can(regex("@.*\\.gserviceaccount\\.com$", var.service_account_email))
    error_message = "Must be a valid service account email."
  }
}

variable "service_account_scopes" {
  type        = list(string)
  description = "OAuth scopes for the service account"
}

variable "ssh_public_keys" {
  type = list(string)
  description = "List of SSH public keys (required)"
}
