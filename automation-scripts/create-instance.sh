#!/bin/bash

set -e

ENV=$1
INSTANCE=$2
SSH_KEY_FILE=$3

if [ -z "$ENV" ] || [ -z "$INSTANCE" ] || [ -z "$SSH_KEY_FILE" ]; then
  echo "Usage: $0 <ENV> <INSTANCE> <SSH_KEY_FILE>"
  echo ""
  echo "Also ensure the following environment variables are exported:"
  echo "  PROJECT - GCP project ID"
  echo "  REGION  - GCP region"
  echo "  ZONE    - GCP zone"
  exit 1
fi

if [ -z "$PROJECT" ] || [ -z "$REGION" ] || [ -z "$ZONE" ]; then
  echo "Error: PROJECT, REGION, and ZONE environment variables must be set."
  exit 1
fi

INSTANCE_DIR="./environments/${ENV}/${INSTANCE}"

mkdir -p ${INSTANCE_DIR}
cp ./environments/default/vm-template/*.tf ${INSTANCE_DIR}/
cp ./environments/default/vm-template/terraform.tfvars.template.final ${INSTANCE_DIR}/terraform.tfvars

sed -i '' "s|__PROJECT__|${PROJECT}|g" ${INSTANCE_DIR}/terraform.tfvars
sed -i '' "s|__REGION__|${REGION}|g" ${INSTANCE_DIR}/terraform.tfvars
sed -i '' "s|__ZONE__|${ZONE}|g" ${INSTANCE_DIR}/terraform.tfvars

sed -i '' "s|\${ENV}|${ENV}|g" ${INSTANCE_DIR}/terraform.tfvars
sed -i '' "s|\${INSTANCE}|${INSTANCE}|g" ${INSTANCE_DIR}/terraform.tfvars

SSH_KEY_CONTENT=$(cat ${SSH_KEY_FILE} | sed -e 's/[\/&]/\\&/g')
sed -i '' "s|__SSH_KEY_CONTENT__|${SSH_KEY_CONTENT}|g" ${INSTANCE_DIR}/terraform.tfvars

echo "✅ Instance configuration created successfully in ${INSTANCE_DIR}"
