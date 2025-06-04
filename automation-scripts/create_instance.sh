
#!/bin/bash

ENV=$1
INSTANCE=$2

if [ -z "$ENV" ] || [ -z "$INSTANCE" ]; then
  echo "Usage: $0 <env> <instance>"
  exit 1
fi

BASE_DIR=environments/$ENV/$INSTANCE

mkdir -p $BASE_DIR

cp environments/dev/vm-01/main.tf $BASE_DIR/
cp environments/dev/vm-01/variables.tf $BASE_DIR/
cp environments/dev/vm-01/terraform.tfvars $BASE_DIR/

sed -i "" "s/vm-01/$INSTANCE/g" $BASE_DIR/terraform.tfvars
sed -i "" "s/instance = \"vm-01\"/instance = \"$INSTANCE\"/g" $BASE_DIR/terraform.tfvars

echo "New instance $INSTANCE created for $ENV."
