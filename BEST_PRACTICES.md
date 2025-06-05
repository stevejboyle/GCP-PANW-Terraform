
# Terraform VM-Series Deployment — Best Practices

This repo implements enterprise-grade Terraform patterns for multi-environment Palo Alto VM-Series deployments on GCP.

---

## ✅ Key Design Principles

- ✅ Fully modular design (reusable `modules/vmseries`)
- ✅ Fully validated variables (`variables.tf` with type & regex validation)
- ✅ SSH keys handled via environment-local file injection (`gcp.key.pub`)
- ✅ SSH key logic handled via `locals {}` in env-level `main.tf`
- ✅ Module consumes fully pre-computed metadata (pure interface)
- ✅ CMEK disk encryption fully supported (Google Cloud native pattern)
- ✅ Separate persistent disk resource (`google_compute_disk`) for KMS encryption
- ✅ All automation & scripting fully integrated via Makefile

---

## ✅ Directory Structure

- `modules/vmseries` — core reusable module
- `environments/dev|test|prod/vm-01` — instance-specific configurations
- `automation-scripts/` — helper scripts to create new instances
- `Makefile` — full automation entrypoint
- `README.md` — operational usage guide
- `validate.sh` — fast validation for CI/CD pipelines

---

## ✅ SSH Key Handling Flow

- SSH key read via:
```hcl
file("${path.module}/gcp.key.pub")
```
- Key merged into metadata block at environment-level `main.tf`:
```hcl
locals {
  metadata = merge(var.metadata, {
    ssh-keys = "admin:${local.ssh_key_content}"
  })
}
```

---

## ✅ CMEK (Customer Managed Encryption Keys)

- KMS keys supported via:
```hcl
google_compute_disk.boot_disk with dynamic disk_encryption_key
```
- Disk encryption key default provided in `terraform.tfvars`
- Optional override supported per environment

---

## ✅ Fully CI/CD-Safe Patterns

- No interactive prompts required during apply or plan
- Makefile ensures consistent environment creation and updates
- `make replace-ssh-key SSH_KEY_FILE=...` auto-populates keys across environments

---

