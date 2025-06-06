#!/bin/bash

set -e

ENV=$1
INSTANCE=$2
SSH_KEY_FILE=$3

if [ -z "$ENV" ] || [ -z "$INSTANCE" ] || [ -z "$SSH_KEY_FILE" ]; then
  echo "Usage: $0 <ENV> <INSTANCE> <SSH_KEY_FILE>"
  exit 1
fi

DEST_DIR=./environments/${ENV}/${INSTANCE}

if [ ! -d "$DEST_DIR" ]; then
  echo "ERROR: Instance directory ${DEST_DIR} does not exist!"
  exit 1
fi

KEY_CONTENT=$(cat ${SSH_KEY_FILE} | tr -d '\n')
FORMATTED_KEY="admin:${KEY_CONTENT}"
ESCAPED_KEY=$(printf '%s' "$FORMATTED_KEY" | sed 's/[&/]/\\&/g')

sed -i '' "s|__SSH_KEY_CONTENT__|${ESCAPED_KEY}|g" ${DEST_DIR}/terraform.tfvars

