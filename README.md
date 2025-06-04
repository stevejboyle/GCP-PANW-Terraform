
# Terraform VM-Series Multi-Instance Deployment

This repository provides a fully modular, scalable, and environment-isolated Terraform configuration to deploy Palo Alto VM-Series instances on Google Cloud.

---

## 📦 Project Structure

```
terraform-vmseries-multi-instance/
├── automation-scripts/
│   ├── create_instance.sh
│   └── destroy_instance.sh
├── environments/
│   ├── dev/
│   │   ├── vm-01/
│   │   ├── vm-02/
│   │   └── vm-03/
│   ├── test/
│   │   └── (same as dev)
│   └── prod/
│       └── (same as dev)
└── modules/
    └── vmseries/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

- Each environment (`dev`, `test`, `prod`) contains independently deployable instances.
- Each instance has its own state and can be deployed or destroyed independently.
- No remote state or backend required (local state by default).

---

## 🚀 Usage

### 1️⃣ Initialize and Apply an Existing Instance

```bash
cd environments/dev/vm-01
terraform init
terraform apply
```

### 2️⃣ Create New Instances Automatically

```bash
cd automation-scripts
./create_instance.sh dev vm-04
```

This will clone a new instance directory under the given environment. Then:

```bash
cd ../environments/dev/vm-04
terraform init
terraform apply
```

### 3️⃣ Destroy an Instance

```bash
cd automation-scripts
./destroy_instance.sh dev vm-04
```

---

## 🔧 Customization

- Edit `terraform.tfvars` in each instance directory to modify deployment details.
- All variables are strictly validated via `variables.tf`.

---

## 🔒 Remote State (Optional)

This version defaults to local state. If you want to configure remote state in the future, simply add backend configs inside each instance folder.

---

## 🧰 Requirements

- Terraform >= 1.3.0
- Google Cloud SDK configured (`gcloud auth application-default login`)
- Enable required GCP APIs:
  - Compute Engine API
  - IAM API

---

## 🌎 Supported GCP Resources

- Google Compute Engine Instances
- Multi-NIC interfaces (inside, outside, mgmt)
- Palo Alto VM-Series Images

---

## ✅ Production-Ready Features

- Per-instance state isolation
- Multi-environment deployment model
- Instance-specific scaling & deletion
- Variable validation and safety checks
- Reusable module structure

---

