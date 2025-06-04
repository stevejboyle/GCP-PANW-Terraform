
# Terraform VM-Series Multi-Instance Deployment (GCP)

Fully automated, fully validated Terraform deployment for Palo Alto VM-Series on GCP.

---

## ✅ Features

- Multi-environment (`dev`, `test`, `prod`)
- Multi-instance (deploy independently per instance)
- Fully validated variables (strict type + regex validation)
- SSH key injection read dynamically from file at runtime (`gcp.key.pub`)
- Block project-wide SSH keys for security (`block-project-ssh-keys = true`)
- Automation scripts to easily generate new instances
- Makefile automation for one-command operations

---

## 🚀 Usage

### ✅ 1️⃣ Provide your SSH public key

Create a file called `gcp.key.pub` in the repo root directory containing your SSH public key.

Example:

```bash
cat ~/.ssh/id_rsa.pub > gcp.key.pub
```

### ✅ 2️⃣ Deploy instance

```bash
make apply ENV=dev INSTANCE=vm-01
```

### ✅ 3️⃣ Destroy instance

```bash
make destroy ENV=prod INSTANCE=vm-03
```

### ✅ 4️⃣ Validate configuration

```bash
make validate ENV=test INSTANCE=vm-02
```

### ✅ 5️⃣ Create new instance

```bash
make create-instance ENV=dev INSTANCE=vm-04
```

---

## ✅ Directory Structure

- `modules/vmseries/` — reusable VM module
- `environments/{env}/{instance}/` — independent deployments
- `automation-scripts/` — helper automation scripts
- `Makefile` — operational interface

---

## ✅ Security Notes

- SSH public keys are read dynamically from `gcp.key.pub`.
- Project-wide SSH keys are blocked (`block-project-ssh-keys = true`).
- Only instance metadata keys will work.

---

## ✅ Requirements

- Terraform >= 1.3.0
- GCP project access & credentials
- Compute Engine API enabled

---

