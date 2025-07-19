
variable "vpc_cidr" {}
variable "public_subnet_cidrs" { type = list(string) }
variable "private_subnet_cidrs" { type = list(string) }
variable "azs" { type = list(string) }

variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "iam_instance_profile" {}

variable "cloudflare_api_token" {}
variable "domain" {}
variable "record_name" {}

variable "github_token" {}
variable "github_owner" {}
variable "github_repo" {}
variable "aws_role_arn" {}

variable "datadog_api_key" {}
variable "datadog_app_key" {}
variable "aws_account_id" {}
variable "datadog_aws_role_name" {}

variable "bastion_ami_id" {
  description = "AMI ID for the bastion host instance"
  type        = string
}

variable "bastion_instance_type" {
  description = "EC2 instance type for the bastion host"
  type        = string
}

variable "splunk_hec_url" {
  description = "Splunk HTTP Event Collector URL"
  type        = string
}

variable "splunk_hec_token" {
  description = "Splunk HTTP Event Collector token"
  type        = string
  sensitive   = true
}
