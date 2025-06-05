
#!/bin/bash

ENV=$1
INSTANCE=$2

if [ -z "$ENV" ] || [ -z "$INSTANCE" ]; then
  echo "Usage: ./validate.sh <env> <instance>"
  exit 1
fi

cd environments/${ENV}/${INSTANCE}
terraform init -backend=false
terraform validate
