
# Terraform VM-Series Multi-Instance Deployment (GCP)

Fully automated, fully validated Terraform deployment for Palo Alto VM-Series on GCP.

---

## 🚀 Features

- Multi-environment (`dev`, `test`, `prod`)
- Multi-instance (deploy independently per instance)
- Fully validated variables (strict type + regex validation)
- SSH key injection via local `gcp.key.pub` file per environment instance
- SSH key automatically loaded using `locals {}` — no more interactive prompts
- `make apply` automatically updates SSH keys before deployment
- Fully CI/CD-ready

---

## 🚀 Usage

### 1️⃣ Prepare SSH Key

Before running apply, you must inject your SSH public key into all environment instances:

```bash
make replace-ssh-key SSH_KEY_FILE=/path/to/your/gcp.key.pub
```

> This will copy your SSH key into each environment's instance folder automatically.

### 2️⃣ Apply Instance

```bash
make apply ENV=dev INSTANCE=vm-01 SSH_KEY_FILE=/path/to/your/gcp.key.pub
```

> `make apply` will automatically call `replace-ssh-key` for you when SSH_KEY_FILE is provided.

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

## 🚀 SSH Key Flow Summary

- Each environment instance folder contains its own `gcp.key.pub`.
- These files are replaced automatically using `make replace-ssh-key`.
- During apply, the key is loaded locally via `file("${path.module}/${var.ssh_key_file}")`.

---

