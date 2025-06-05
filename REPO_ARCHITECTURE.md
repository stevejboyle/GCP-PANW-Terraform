
# Repo Architecture

📂 terraform-vmseries/
│
├── gcp.key.pub
├── modules/
│   └── vmseries/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── environments/
│   ├── dev/test/prod/
│   │   └── vm-01/vm-02/vm-03/
│   │       ├── main.tf
│   │       ├── variables.tf
│   │       └── terraform.tfvars
├── automation-scripts/
│   └── create_instance.sh
├── Makefile
├── validate.sh
├── README.md
└── PRODUCTION_CHECKLIST.md
