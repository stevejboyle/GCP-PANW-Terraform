
# Terraform VM-Series Multi-Instance Deployment (GCP)

Fully automated, fully validated Terraform deployment for Palo Alto VM-Series on GCP.

---

## Features

- Multi-environment (`dev`, `test`, `prod`)
- Multi-instance (deploy independently per instance)
- Fully validated variables (strict type + regex validation)
- SSH key injection via `gcp.key.pub` loaded dynamically using file() inside tfvars
- Block project-wide SSH keys for security
- Makefile automation

---

## Usage

### 1️⃣ Create gcp.key.pub

```bash
cat ~/.ssh/id_rsa.pub > gcp.key.pub
```

### 2️⃣ Apply instance

```bash
make apply ENV=dev INSTANCE=vm-01
```

### 3️⃣ Destroy instance

```bash
make destroy ENV=dev INSTANCE=vm-01
```

### 4️⃣ Validate

```bash
make validate ENV=dev INSTANCE=vm-01
```

---
