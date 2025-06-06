#!/bin/bash

set -e

ENV=$1
INSTANCE=$2
SSH_KEY_FILE=$3
PROJECT=$4
REGION=$5
ZONE=$6

if [ -z "$ENV" ] || [ -z "$INSTANCE" ] || [ -z "$SSH_KEY_FILE" ] || [ -z "$PROJECT" ] || [ -z "$REGION" ] || [ -z "$ZONE" ]; then
  echo "Usage: $0 <ENV> <INSTANCE> <SSH_KEY_FILE> <PROJECT> <REGION> <ZONE>"
  exit 1
fi

TEMPLATE_DIR=./environments/default/vm-template
DEST_DIR=./environments/${ENV}/${INSTANCE}
mkdir -p $DEST_DIR
cp -r ${TEMPLATE_DIR}/. ${DEST_DIR}/

# Rename template file to terraform.tfvars
mv ${DEST_DIR}/terraform.tfvars.template.final ${DEST_DIR}/terraform.tfvars

sed -i '' "s|__PROJECT__|${PROJECT}|g" ${DEST_DIR}/terraform.tfvars
sed -i '' "s|__REGION__|${REGION}|g" ${DEST_DIR}/terraform.tfvars
sed -i '' "s|__ZONE__|${ZONE}|g" ${DEST_DIR}/terraform.tfvars
sed -i '' "s|\${ENV}|${ENV}|g" ${DEST_DIR}/terraform.tfvars
sed -i '' "s|\${INSTANCE}|${INSTANCE}|g" ${DEST_DIR}/terraform.tfvars
