
# Operations Guide

## Environments

- dev/
- test/
- prod/

Each environment has independent instances you can apply/destroy independently.

## Automation

- `make apply ENV=dev INSTANCE=vm-01`
- `make destroy ENV=test INSTANCE=vm-02`
- `make create-instance ENV=dev INSTANCE=vm-04`

## Security

- Project-wide SSH keys are blocked (`block-project-ssh-keys = true`)
- Only injected keys via `ssh_public_keys` are used.
