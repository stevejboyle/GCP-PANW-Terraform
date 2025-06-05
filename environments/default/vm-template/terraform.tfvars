
environment      = "<ENVIRONMENT>"
instance         = "<INSTANCE>"
project          = "sboyle-panw-test"
region           = "us-east1"
zone             = "us-east1-b"
instance_name    = "<INSTANCE>"
machine_type     = "n2-standard-4"
boot_disk_size   = 100
boot_disk_type   = "pd-balanced"
source_image     = "projects/sboyle-panw-test/global/images/YOUR_CUSTOM_IMAGE_HERE"
service_account_email  = "terraform-deployer@sboyle-panw-test.iam.gserviceaccount.com"
service_account_scopes = ["cloud-platform"]

labels = {
  environment = "<ENVIRONMENT>"
  instance    = "<INSTANCE>"
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

ssh_key_content = "REPLACE_ME_SSH_KEY_CONTENT"
disk_encryption_key_name = null
disk_encryption_keyring  = "US-East-1-KeyRing"
