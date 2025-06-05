
# Terraform Platform Release Process (Final CMEK Image Pattern)

---

## ✅ Version Tagging

- Tag stable releases using semantic versioning:
  - `v1.0.0`, `v1.1.0`, `v2.0.0`

```bash
git tag v1.0.1
git push origin v1.0.1
```

---

## ✅ Change Control

- All changes must be peer reviewed via pull requests
- CI/CD pipeline will validate plan & policy checks
- Tagging occurs *after* successful PR merge and approval

---

## ✅ Terraform Cloud / Remote Backend

- Recommended: use GCS backend for locking & state versioning
- State files must never be stored locally in Git

---

## ✅ CMEK Management

- The current design uses Google's recommended image-level CMEK encryption pattern.
- Custom GCP images are created dynamically for each instance using `google_compute_image`.
- CMEK is applied via the `image_encryption_key` block.

---
