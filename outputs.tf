output "alb_dns_name" {
  value = module.compute.alb_dns_name
}

output "repo_url" {
  value = module.ci_cd.repo_url
}

output "vpc_id" {
  value = module.network.vpc_id
}