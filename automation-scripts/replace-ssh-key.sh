#!/bin/bash

set -e

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <environment> <instance-name> <ssh-key-file>"
  exit 1
fi

ENV=$1
INSTANCE=$2
SSH_KEY_FILE=$3

DST_DIR="./environments/${ENV}/${INSTANCE}"

# Sanity check that destination exists
if [ ! -d "${DST_DIR}" ]; then
  echo "ERROR: Instance directory ${DST_DIR} does not exist!"
  exit 1
fi

# Read SSH key content
SSH_KEY_CONTENT=$(cat "${SSH_KEY_FILE}")

# Remove any existing ssh_key_content entry
sed -i.bak '/^ssh_key_content/d' "${DST_DIR}/terraform.tfvars"
rm "${DST_DIR}/terraform.tfvars.bak"

# Append the updated ssh_key_content to tfvars
echo "" >> "${DST_DIR}/terraform.tfvars"
echo "ssh_key_content = \"admin:${SSH_KEY_CONTENT}\"" >> "${DST_DIR}/terraform.tfvars"

echo "✅ SSH key successfully injected into ${DST_DIR}/terraform.tfvars"

