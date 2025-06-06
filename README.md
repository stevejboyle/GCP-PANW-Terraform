# Palo Alto VM-Series Terraform Deployment for GCP

This repository automates deployment of Palo Alto VM-Series firewalls in GCP using Terraform with full support for:
- Environment and instance separation (prod, dev, test, etc.)
- Fully parameterized VM configuration
- Automatic SSH key injection
- CMEK disk encryption support
- Multi-NIC configuration (outside, management, inside)
- Automation scripts for easy instance creation/deletion

## Directory Structure

```bash
environments/
  default/
    vm-template/        <- Base template for new instances
  prod/
    vm-01/              <- Sample instance
automation-scripts/      <- create-instance.sh, delete-instance.sh, replace-ssh-key.sh
modules/
  vmseries/              <- Reusable module for VM creation
```

## Automation Scripts

- **create-instance.sh** — creates new instance directory by copying `vm-template` and replacing placeholders.
- **delete-instance.sh** — deletes an instance directory from environment.
- **replace-ssh-key.sh** — injects SSH key into instance's terraform.tfvars file.

## Makefile Targets

- `make create-instance ENV=prod INSTANCE=vm-01 SSH_KEY_FILE=gcp.key.pub PROJECT=... REGION=... ZONE=...`
- `make apply ENV=... INSTANCE=...`
- `make plan ENV=... INSTANCE=...`
- `make destroy ENV=... INSTANCE=...`
- `make delete-instance ENV=... INSTANCE=...`

## Required Variables

- `project`, `region`, `zone`
- `instance_name`, `machine_type`, `labels`
- `source_image`, `boot_disk_size`, `boot_disk_type`
- `network_interfaces` with subnetwork, has_public, queue_count, etc.
- `metadata` includes block-project-ssh-keys, serial-port-enable, mgmt-interface-swap, ssh-keys (auto-populated)

## Example create-instance Command

```bash
make create-instance ENV=prod INSTANCE=vm-42 SSH_KEY_FILE=gcp.key.pub PROJECT="your-project" REGION="us-east1" ZONE="us-east1-b"
```

---