
# Terraform VM-Series Multi-Instance Deployment (GCP)

Fully automated, fully validated Terraform deployment for Palo Alto VM-Series on GCP.

---

## 🚀 Features

- Multi-environment (`dev`, `test`, `prod`)
- Multi-instance (deploy independently per instance)
- CMEK disk encryption fully supported (via `disk_encryption_key`)
- Fully validated variables (strict type + regex validation)
- SSH key injection via local `gcp.key.pub` file per environment instance
- SSH key automatically loaded using `locals {}`
- `make apply` automatically updates SSH keys before deployment
- Fully CI/CD-ready

---

## 🚀 Usage

### 1️⃣ Prepare SSH Key

Before running apply, you must inject your SSH public key into all environment instances:

```bash
make replace-ssh-key SSH_KEY_FILE=/path/to/your/gcp.key.pub
```

### 2️⃣ Apply Instance

```bash
make apply ENV=dev INSTANCE=vm-01 SSH_KEY_FILE=/path/to/your/gcp.key.pub
```

### 3️⃣ Destroy Instance

```bash
make destroy ENV=dev INSTANCE=vm-01
```

### 4️⃣ Validate

```bash
make validate ENV=dev INSTANCE=vm-01
```

### 5️⃣ Create New Instance

```bash
make create-instance ENV=dev INSTANCE=vm-04
```

---

## 🚀 CMEK Support

By default, disk_encryption_key is set to `PA-VM-Disk-Crypt`. To override:

```hcl
disk_encryption_key = "your-kms-resource-id"
```

