
#!/bin/bash

set -e

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <environment> <instance-name> <ssh-key-file>"
  exit 1
fi

ENV=$1
INSTANCE=$2
SSH_KEY_FILE=$3

SRC_DIR="./environments/default/vm-template"
DST_DIR="./environments/${ENV}/${INSTANCE}"

mkdir -p "${DST_DIR}"
cp -r ${SRC_DIR}/* "${DST_DIR}/"

# Replace placeholders
sed -i.bak "s|<ENVIRONMENT>|${ENV}|g" "${DST_DIR}/terraform.tfvars"
sed -i.bak "s|<INSTANCE>|${INSTANCE}|g" "${DST_DIR}/terraform.tfvars"
rm "${DST_DIR}/terraform.tfvars.bak"

# Inject SSH key content directly into tfvars
SSH_KEY_CONTENT=$(cat ./gcp.key.pub)
sed -i.bak "s|REPLACE_ME_SSH_KEY_CONTENT|admin:${SSH_KEY_CONTENT}|" "${DST_DIR}/terraform.tfvars"
rm "${DST_DIR}/terraform.tfvars.bak"

echo "✅ Created new instance configuration at ${DST_DIR}"
