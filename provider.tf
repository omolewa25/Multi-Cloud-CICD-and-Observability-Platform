
provider "aws" {
  region = "us-east-1"
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

provider "github" {
  token = var.github_token
  owner = var.github_owner
}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}