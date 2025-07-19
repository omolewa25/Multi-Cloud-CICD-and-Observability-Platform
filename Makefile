# Define Terraform command wrapper
TF=terraform

# Default target: help menu
.DEFAULT_GOAL := help

init: ## Initialize Terraform working directory
	$(TF) init

validate: ## Validate Terraform configuration
	$(TF) validate

plan: ## Show Terraform execution plan
	$(TF) plan

apply: ## Apply Terraform changes
	$(TF) apply -auto-approve

format: ## Format Terraform code
	$(TF) fmt -recursive

lint: ## Run tflint for linting
	tflint

sec: ## Run tfsec for static analysis
	tfsec .

checkov: ## Run Checkov security scanner
	checkov -d .

all-sec: lint sec checkov ## Run all security checks

clean: ## Remove .terraform directory and state files
	rm -rf .terraform terraform.tfstate terraform.tfstate.backup

help: ## Display this help message
	@echo "\nUsage: make <target>\n"
	@awk -F":|##" '/^[a-zA-Z_-]+:.*##/ { printf "\033[36m%-15s\033[0m %s\n", $$1, $$NF }' $(MAKEFILE_LIST)
