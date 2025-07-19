
provider "github" {
  token = var.github_token
  owner = var.github_owner
}

resource "github_repository" "ci_cd_repo" {
  name        = var.github_repo
  description = "Multi-cloud CI/CD Terraform managed repo"
  visibility  = "private"
  auto_init   = true
}

resource "github_actions_secret" "aws_role" {
  repository = github_repository.ci_cd_repo.name
  secret_name = "AWS_ROLE_ARN"
  plaintext_value = var.aws_role_arn
}

resource "github_actions_secret" "datadog_key" {
  repository = github_repository.ci_cd_repo.name
  secret_name = "DATADOG_API_KEY"
  plaintext_value = var.datadog_api_key
}

output "repo_url" {
  value = github_repository.ci_cd_repo.http_clone_url
}