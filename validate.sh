
#!/bin/bash

echo "🧪 Terraform VM-Series Deployment Preflight Check"

ENV=$1
INSTANCE=$2

if [ -z "$ENV" ] || [ -z "$INSTANCE" ]; then
  echo "Usage: ./validate.sh <env> <instance>"
  exit 1
fi

WORK_DIR=environments/${ENV}/${INSTANCE}
KEY_FILE=gcp.key.pub

if [ ! -f "$KEY_FILE" ]; then
  echo "❌ Missing SSH key file: $KEY_FILE"
  exit 2
fi

cd $WORK_DIR

echo "✅ Validating Terraform configuration in $WORK_DIR"
terraform init -backend=false >/dev/null
terraform validate

if [ $? -eq 0 ]; then
  echo "✅ Validation passed."
else
  echo "❌ Validation failed."
  exit 3
fi
