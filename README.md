# Terraform GCP VM-Series Deployment

## Overview

This repository automates the deployment of Palo Alto VM-Series firewalls into GCP using Terraform. It supports:

- Multiple environments (`dev`, `prod`, etc.)
- Multiple independently managed instances per environment
- CMEK disk encryption (optional)
- Dynamic SSH key injection from external files
- Fully parameterized network interfaces and metadata
- Simplified instance lifecycle management via Makefile

## Usage

### 1️⃣ Prerequisites

- GCP project and service account configured
- Enable necessary GCP APIs
- Prepare your SSH public key (`gcp.key.pub`)

### 2️⃣ Creating an Instance

```bash
export PROJECT="your-gcp-project"
export REGION="us-east1"
export ZONE="us-east1-b"

make create-instance ENV=dev INSTANCE=vm-01 SSH_KEY_FILE=gcp.key.pub PROJECT=$PROJECT REGION=$REGION ZONE=$ZONE
```

### 3️⃣ Deploying

```bash
make apply ENV=dev INSTANCE=vm-01 PROJECT=$PROJECT REGION=$REGION ZONE=$ZONE
```

### 4️⃣ Destroying

```bash
make destroy ENV=dev INSTANCE=vm-01 PROJECT=$PROJECT REGION=$REGION ZONE=$ZONE
```

### 5️⃣ Deleting Instance Files

```bash
make delete-instance ENV=dev INSTANCE=vm-01
```

## Notes

- SSH keys are injected dynamically via `replace-ssh-key.sh`.
- CMEK defaults: `PA-VM-Disk-Crypt` and `US-East-1-KeyRing` (can be overridden).
- Default image: Palo Alto BYOL 11.2.3-h3 (`vmseries-byol-1123h3`).

## Disclaimer

This is unsupported code and is a sample to be used by the community.   This is my personal project and in no way should be construed as representative of a work by my employer.
