
# Recommended Git Repo Structure

📦 terraform-vmseries-prod/
│
├── gcp.key.pub              # NOT checked into Git - provided at runtime only
│
├── modules/
│   └── vmseries/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── environments/
│   ├── dev/
│   │   └── vm-01/ vm-02/ vm-03/
│   │       ├── main.tf
│   │       ├── variables.tf
│   │       └── terraform.tfvars
│   ├── test/ (same as dev)
│   └── prod/ (same as dev)
│
├── automation-scripts/
│   └── create_instance.sh
│
├── Makefile
├── validate.sh
├── README.md
├── PRODUCTION_CHECKLIST.md
└── REPO_ARCHITECTURE.md

---

## ✅ Git Repo Policies

- Do NOT commit `gcp.key.pub`.
- Use `.gitignore` to block any credentials or sensitive files.
- Commit code, configuration, variables, and automation only.
- Tag stable releases using semantic versions (`v1.0.0`, `v1.1.0`, etc).

