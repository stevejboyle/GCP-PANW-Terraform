
#!/bin/bash

# Usage: ./create_instance.sh <env> <instance_name>

ENV=$1
INSTANCE=$2

if [ -z "$ENV" ] || [ -z "$INSTANCE" ]; then
  echo "Usage: $0 <env> <instance_name>"
  exit 1
fi

BASE_DIR=environments/$ENV/$INSTANCE

mkdir -p $BASE_DIR

cp environments/dev/vm-01/main.tf $BASE_DIR/
cp environments/dev/vm-01/variables.tf $BASE_DIR/
cp environments/dev/vm-01/terraform.tfvars $BASE_DIR/

# Update instance-specific values
sed -i "" "s/vm01-fw/${INSTANCE}-fw/g" $BASE_DIR/terraform.tfvars
sed -i "" "s/instance = \"vm01\"/instance = \"${INSTANCE}\"/g" $BASE_DIR/terraform.tfvars

echo "Instance $INSTANCE created in environment $ENV."
echo "Please review terraform.tfvars in $BASE_DIR before applying."
