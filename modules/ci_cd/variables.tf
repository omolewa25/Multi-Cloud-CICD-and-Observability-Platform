
variable "github_token" {
  type = string
  description = "GitHub personal access token"
}

variable "github_owner" {
  type = string
  description = "GitHub username or organization"
}

variable "github_repo" {
  type = string
  description = "GitHub repository name"
}

variable "aws_role_arn" {
  type = string
  description = "AWS IAM role ARN for GitHub OIDC"
}

variable "datadog_api_key" {
  type = string
  description = "Datadog API key for monitoring"
}
