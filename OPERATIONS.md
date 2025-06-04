
# 🚀 Terraform VM-Series Deployment Operations Guide

This guide serves as a quick reference for daily operations, maintenance, and scaling of the Terraform VM-Series deployment repo.

---

## 📦 Repository Structure Overview

- **modules/** — reusable VM-Series Terraform module
- **environments/** — fully isolated per-environment deployments (`dev`, `test`, `prod`)
- **automation-scripts/** — helper scripts for creating and destroying new instances
- **Makefile** — simplified interface for common Terraform commands

---

## ⚙️ Common Operations

### 1️⃣ Deploy an Existing Instance

```bash
make apply ENV=dev INSTANCE=vm-01
```

### 2️⃣ Destroy an Existing Instance

```bash
make destroy ENV=prod INSTANCE=vm-03
```

### 3️⃣ Validate Configuration

```bash
make validate ENV=test INSTANCE=vm-02
```

### 4️⃣ Plan Changes Before Applying

```bash
make plan ENV=dev INSTANCE=vm-01
```

---

## 🔧 Create New Instances

### Auto-generate new instance directory structure:

```bash
make create-instance ENV=dev INSTANCE=vm-04
```

> ⚠️ After creation, review the new `terraform.tfvars` file and adjust instance-specific settings as needed.

### Apply the new instance:

```bash
make apply ENV=dev INSTANCE=vm-04
```

---

## 📝 Notes on Isolation

- Each instance has completely independent Terraform state (`terraform.tfstate`).
- Changes to one instance will never impact others.
- Destroying one instance will not affect the rest.

---

## 🔒 Backend State (optional)

Currently configured for **local state only** for simplicity.  
You may add remote state (`backend.tf`) later if your organization requires state centralization.

---

## 🧰 Dependencies

- Terraform >= 1.3.0
- GCP project access + credentials (`gcloud auth application-default login`)
- GCP APIs enabled: Compute Engine, IAM

---

## 🔥 Support Contact

For troubleshooting or enhancements, contact: **`Terraform Infrastructure Team`**.

---

