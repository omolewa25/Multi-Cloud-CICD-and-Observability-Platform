#!/bin/bash

set -e

COMMAND=$1

usage() {
  echo "Usage: ./terraform-wrapper.sh [init|plan|apply|validate|format|lint|sec|checkov|all-sec|clean]"
  exit 1
}

if [ -z "$COMMAND" ]; then
  usage
fi

case $COMMAND in
  init)
    terraform init
    ;;
  plan)
    terraform plan
    ;;
  apply)
    terraform apply -auto-approve
    ;;
  validate)
    terraform validate
    ;;
  format)
    terraform fmt -recursive
    ;;
  lint)
    tflint
    ;;
  sec)
    tfsec .
    ;;
  checkov)
    checkov -d .
    ;;
  all-sec)
    tflint && tfsec . && checkov -d .
    ;;
  clean)
    rm -rf .terraform terraform.tfstate terraform.tfstate.backup
    ;;
  *)
    usage
    ;;
esac
