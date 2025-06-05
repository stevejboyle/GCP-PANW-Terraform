
environment      = "prod"
instance         = "vm-42"
project          = "sboyle-panw-test"
region           = "us-east1"
zone             = "us-east1-b"
instance_name    = "vm-42"
machine_type     = "n2-standard-4"
boot_disk_size   = 100
boot_disk_type   = "pd-balanced"
source_image     = "projects/sboyle-panw-test/global/images/YOUR_CUSTOM_IMAGE_HERE"
service_account_email  = "terraform-deployer@sboyle-panw-test.iam.gserviceaccount.com"
service_account_scopes = ["cloud-platform"]

labels = {
  environment = "prod"
  instance    = "vm-42"
}

network_interfaces = [
  {
    subnetwork    = "projects/sboyle-panw-test/regions/us-east1/subnetworks/default"
    stack_type    = "IPV4_ONLY"
    queue_count   = 0
    has_public    = true
    network_tier  = "PREMIUM"
  }
]

metadata = {}

disk_encryption_key_name = null
disk_encryption_keyring  = "US-East-1-KeyRing"

ssh_key_content = "admin:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC2BBnFtrO3Zgw7z4LtM9LmcbITrPE9HtPGfg8XC41NG7ePAbeaTlqrn8THWVjMJOHrzxVBDjGOTcaBQOWCAOkBOpxlPh7hM9uUZEM4X6PbjQ/rt5FgfOEAWwGPzec5oRefqRL2HPf61dHLhFTqvuWtmP2dS1ZHLdtlNN6RSIigsy5Dqb1jCEEYJ8hypl3U47xjlAoyyG0KmopCcbb0daML+ROrA54M2jc5utxo8VsaxP8bqT5+0X6yYCVCoGfDLxexw0ikIXxBNc8WbsI5RfJYycPtY9AM8nvJ+XUTVpOvvmw0mpF7dazy9AyNANUlsJEMeFxGMgin4f5nnK1NUhYXbhE5IF1AR5Br712/N2Yroc4nlbG0g1O6X8YHihmk6lEpZnRFTfye/pXpaDF4pF92VWVztg+0Yn4+iLIoWig8Wx16jgnDz0gDvUDd3Ra4/hnIdI+d6o094EEW2DhxzZkt1VRXOTqfF3qZZzBCJ5+qmlEune+SmcL3GhzRRffr6SM= sboyle@M-JJQ24Y919F"
