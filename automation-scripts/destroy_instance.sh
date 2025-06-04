
#!/bin/bash

# Usage: ./destroy_instance.sh <env> <instance_name>

ENV=$1
INSTANCE=$2

if [ -z "$ENV" ] || [ -z "$INSTANCE" ]; then
  echo "Usage: $0 <env> <instance_name>"
  exit 1
fi

cd environments/$ENV/$INSTANCE

terraform destroy

echo "Instance $INSTANCE in environment $ENV destroyed."
