
# Terraform VM-Series Production Handoff Checklist

✅ = MUST complete before first production deployment.

---

## ✅ Initial Repo Validation

- [ ] Clone repo to clean working directory.
- [ ] Confirm `gcp.key.pub` file exists in repo root.
- [ ] Confirm SSH key format: GCP expects: `admin:ssh-rsa ... admin`.

## ✅ Environment Setup

- [ ] Verify GCP project ID inside all `terraform.tfvars` (project = "sboyle-panw-test").
- [ ] Verify correct subnets assigned to `network_interfaces` inside `terraform.tfvars`.
- [ ] Verify service account email present & valid.

## ✅ Terraform Validation

- [ ] Run `terraform version` (Terraform >= 1.3.0 required).
- [ ] Run `make validate ENV=dev INSTANCE=vm-01` (confirm HCL validation passes).
- [ ] Run `make plan ENV=dev INSTANCE=vm-01`.

## ✅ First Deployment

- [ ] Run `make apply ENV=dev INSTANCE=vm-01`.
- [ ] Confirm instance creates successfully in GCP.
- [ ] Verify instance metadata contains:
  - ssh-keys = correct value
  - block-project-ssh-keys = true

## ✅ Post-deployment

- [ ] Confirm successful SSH access via provided key.
- [ ] Confirm instance has assigned external & internal IPs.

---

## ✅ CI/CD Recommendations

- Always provide `gcp.key.pub` into pipeline workspace before apply.
- Use Makefile automation to enforce correct working directory.

---

