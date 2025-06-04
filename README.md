
# Terraform VM-Series Multi-Instance Deployment (Fully Automated)

This repository provides a fully modular, scalable, and environment-isolated Terraform configuration to deploy Palo Alto VM-Series instances on Google Cloud.

---

## ✅ Features

- Multi-environment (`dev`, `test`, `prod`)
- Multi-instance (independent deployments per instance)
- Fully isolated Terraform state (local state)
- Validated variables with safety checks
- Automated SSH key management
- `block-project-ssh-keys` enabled for security
- Automation scripts for instance creation
- Makefile automation for easy operations

---

## 🚀 Quick Usage

### Deploy instance:

```bash
make apply ENV=dev INSTANCE=vm-01
```

### Destroy instance:

```bash
make destroy ENV=test INSTANCE=vm-03
```

### Create new instance automatically:

```bash
make create-instance ENV=dev INSTANCE=vm-04
```

### Validate configuration:

```bash
make validate ENV=dev INSTANCE=vm-01
```

---

## 🔑 SSH Keys

SSH public keys are injected through `ssh_public_keys` variable.
Your provided key has been pre-wired.

---

