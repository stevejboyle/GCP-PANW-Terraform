
# Terraform VM-Series Multi-Instance Deployment

Fully automated, fully validated Terraform deployment for Palo Alto VM-Series on GCP.

---

## Features

- Multi-environment (`dev`, `test`, `prod`)
- Multi-instance (deploy independently per instance)
- Fully validated `variables.tf` (strict type + regex validation)
- SSH key injection (via `ssh_public_keys`)
- Block project-wide SSH keys for security (`block-project-ssh-keys = true`)
- Automation scripts to easily generate new instances
- Makefile automation for `terraform init`, `plan`, `apply`, etc.

---

## Usage

### Apply instance:

```bash
make apply ENV=dev INSTANCE=vm-01
```

### Destroy instance:

```bash
make destroy ENV=prod INSTANCE=vm-03
```

### Validate config:

```bash
make validate ENV=test INSTANCE=vm-02
```

### Create new instance automatically:

```bash
make create-instance ENV=dev INSTANCE=vm-04
```

---

## Directory Structure

- `modules/vmseries/` — core reusable VM module
- `environments/{env}/{instance}/` — isolated instance deployments
- `automation-scripts/` — helper automation scripts
- `Makefile` — one-command automation interface

---

## Notes

- SSH public keys are injected using `ssh_public_keys` variable (see `terraform.tfvars` for example).
- Project-wide SSH keys are fully disabled via instance metadata.

---

## Requirements

- Terraform >= 1.3.0
- GCP project access + credentials
- GCP Compute Engine API enabled

---

## Repo Initialization

```bash
terraform init
terraform validate
```

---

## Team Contact

Infra team: `Terraform VM-Series Owners`

---
