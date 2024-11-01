#!/bin/bash

# Check if a command-line argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 [pwcparentco | pwccarveco]"
  exit 1
fi

# Set the workspace from the command-line argument
WORKSPACE=$1

# Set your environment variables
RESOURCE_GROUP="tfstate"
STORAGE_ACCOUNT="tfstate$WORKSPACE"
# STORAGE_ACCOUNT="ciabdemotfstatebackend"
CONTAINER="tfstate"

# Run terraform init with backend config dynamically set
terraform init \
  -backend-config="resource_group_name=$RESOURCE_GROUP" \
  -backend-config="storage_account_name=$STORAGE_ACCOUNT" \
  -backend-config="container_name=$CONTAINER" \
  -backend-config="key=$WORKSPACE/terraform.tfstate"
