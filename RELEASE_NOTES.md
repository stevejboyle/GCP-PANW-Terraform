# RELEASE_NOTES.md

## Release 1.0.0 — Initial Full Stable Release

### Major Features

- **Multi-Environment Support**
  - Fully parameterized environment structure (`prod`, `dev`, etc.).
  - Supports multiple independent instances per environment.

- **Automated Instance Management**
  - `create-instance.sh` to auto-generate per-instance Terraform directories.
  - `delete-instance.sh` for easy cleanup of instances.
  - Updated `Makefile` with `create-instance`, `delete-instance`, `apply`, `plan`, and `destroy` targets.

- **Dynamic SSH Key Injection**
  - Automatic SSH key replacement using `replace-ssh-key.sh`.
  - Keys read from external file (`gcp.key.pub`) and injected via automation.

- **Full CMEK (Customer Managed Encryption Key) Support**
  - Disk encryption handled via CMEK with fully parameterized key names and keyrings.
  - Optional CMEK configuration with sensible defaults.

- **Network Interface Management**
  - Supports multiple NICs with `has_public` flag to dynamically enable/disable public IPs.
  - Fully parameterized interface configurations in `terraform.tfvars`.

- **Improved Module Design**
  - Simplified `main.tf` structure.
  - Full variable validation.
  - Shielded VM configuration handled properly for boot disk compatibility.

- **Metadata Configuration**
  - Includes `mgmt-interface-swap`, `serial-port-enable`, and `block-project-ssh-keys`.
  - Fully dynamic metadata injection per instance.

### Other Improvements

- Environment variables for `PROJECT`, `REGION`, `ZONE` allow for clean multi-environment usage.
- BSD/macOS compatibility fixes in shell scripts (`sed`, etc.).
- Full separation of environment defaults vs instance-specific configurations.
- README and documentation updated for clear deployment instructions.
- Makefile `validate` target removed due to Terraform template substitution logic.

✅ **This version is the stable foundation for future feature expansion.**