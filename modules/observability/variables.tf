
variable "datadog_api_key" {
  type = string
}

variable "datadog_app_key" {
  type = string
}

variable "aws_account_id" {
  type = string
}

variable "datadog_aws_role_name" {
  type = string
}

variable "slack_account" {
  description = "Slack account name configured in Datadog"
  type        = string
}

variable "slack_channel" {
  description = "Slack channel to send alerts"
  type        = string
}