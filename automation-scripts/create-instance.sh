
#!/bin/bash

set -e

ENV=$1
INSTANCE=$2
SSH_KEY_FILE=$3

if [ -z "$ENV" ] || [ -z "$INSTANCE" ] || [ -z "$SSH_KEY_FILE" ]; then
  echo "Usage: $0 <ENV> <INSTANCE> <SSH_KEY_FILE>"
  exit 1
fi

INSTANCE_DIR="./environments/${ENV}/${INSTANCE}"

if [ -d "$INSTANCE_DIR" ]; then
  echo "Instance directory ${INSTANCE_DIR} already exists!"
  exit 1
fi

# Create instance directory based on template
cp -r ./environments/default/vm-template "$INSTANCE_DIR"

# Verify template file exists
if [ ! -f "${INSTANCE_DIR}/terraform.tfvars.template.final" ]; then
  echo "ERROR: Missing template file: ${INSTANCE_DIR}/terraform.tfvars.template.final"
  exit 1
fi

# Extract project value from template file
PROJECT=$(grep '^project' ${INSTANCE_DIR}/terraform.tfvars.template.final | awk -F'"' '{print $2}')
IMAGE_NAME="${ENV}-${INSTANCE}-custom-image"
SOURCE_IMAGE="projects/${PROJECT}/global/images/${IMAGE_NAME}"

# Read SSH key content and safely escape
SSH_KEY_CONTENT=$(cat ${SSH_KEY_FILE} | sed -e 's/[\/&]/\\&/g')

# Build safe labels block (with comma fix)
LABELS="{ environment = \"${ENV}\", instance = \"${INSTANCE}\" }"

# Perform substitutions
sed -e "s|__ENV__|${ENV}|g"     -e "s|__INSTANCE__|${INSTANCE}|g"     -e "s|__SOURCE_IMAGE__|${SOURCE_IMAGE}|g"     -e "s|__SSH_KEY_CONTENT__|${SSH_KEY_CONTENT}|g"     -e "s|__LABELS__|${LABELS}|g"     ${INSTANCE_DIR}/terraform.tfvars.template.final > ${INSTANCE_DIR}/terraform.tfvars

echo "Instance ${ENV}/${INSTANCE} created successfully."
