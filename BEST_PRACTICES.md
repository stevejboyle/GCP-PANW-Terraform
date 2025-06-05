
# Terraform VM-Series Deployment — Best Practices (Final CMEK Image Pattern)

This repo implements enterprise-grade Terraform patterns for multi-environment Palo Alto VM-Series deployments on GCP, fully CMEK-compliant using Google's native image encryption pattern.

---

## ✅ Key Design Principles

- ✅ Fully modular design (`modules/vmseries`)
- ✅ Fully validated variables (`variables.tf` with type & regex validation)
- ✅ SSH keys handled via environment-local file injection (`gcp.key.pub`)
- ✅ SSH key logic handled via `locals {}` in env-level `main.tf`
- ✅ CMEK encryption applied directly at image creation (`google_compute_image`)
- ✅ Boot disks created automatically from CMEK-encrypted custom images (`initialize_params`)
- ✅ No need for separate `google_compute_disk` resources
- ✅ Fully supported by Google's Terraform provider (no unsupported block issues)
- ✅ All automation & scripting fully integrated via Makefile

---

## ✅ CMEK Pattern Summary

- A custom GCP image (`google_compute_image`) is dynamically created per VM instance.
- CMEK encryption applied directly during custom image creation.
- The compute instance uses the custom CMEK-encrypted image as its boot disk via `initialize_params`.

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
    ssh-keys = "admin:${local.ssh_key_content}",
    block-project-ssh-keys = "true"
  })
}
```

---

## ✅ Fully CI/CD-Safe Patterns

- No interactive prompts required during apply or plan
- Makefile ensures consistent environment creation and updates
- `make replace-ssh-key SSH_KEY_FILE=...` auto-populates keys across environments

---
