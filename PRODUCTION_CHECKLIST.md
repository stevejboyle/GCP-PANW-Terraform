
# Terraform VM-Series Production Handoff Checklist

✅ = Must complete before first deployment.

- [ ] Verify gcp.key.pub exists in repo root.
- [ ] Validate SSH key format (admin:ssh-rsa ... admin).
- [ ] Confirm project, network, service account configs in tfvars.
- [ ] Run: make validate ENV=dev INSTANCE=vm-01
- [ ] Run: make apply ENV=dev INSTANCE=vm-01
- [ ] Confirm SSH access to deployed instance.

---
