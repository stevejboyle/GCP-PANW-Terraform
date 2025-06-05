
# Terraform VM-Series Enterprise Platform (CMEK + Default Template)

This repo implements enterprise-grade Terraform deployment of Palo Alto VM-Series on GCP with full CMEK encryption.

---

## ✅ Key Features

- CMEK applied at image-level encryption (google_compute_image)
- Default reusable environment template located at: `environments/default/vm-template/`
- `create-instance.sh` automation now pulls new instances from the default template
- SSH keys injected via local metadata
- Block project-wide SSH keys enabled
- Fully CI/CD compatible design

---

## ✅ Instance Creation Workflow

To create a new instance config:

```bash
./automation-scripts/create-instance.sh <environment> <instance-name> <region>
```

Example:

```bash
./automation-scripts/create-instance.sh dev vm-02 us-east1
```

---

## ✅ CMEK Encryption Flow

- Custom GCP images are created dynamically per instance
- CMEK keys applied directly at image creation
- Boot disk created automatically from CMEK-encrypted image

---

## ✅ Repo Structure

- `modules/vmseries` — core reusable module
- `environments/default/vm-template` — reusable golden template
- `environments/dev|test|prod` — deployed environments
- `automation-scripts/` — helper instance creation automation
- `BEST_PRACTICES.md` / `RELEASE_PROCESS.md` — enterprise platform docs

---
