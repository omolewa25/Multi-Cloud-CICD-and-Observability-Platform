
module "network" {
  source             = "./modules/network"
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                = var.azs
}

module "compute" {
  source                = "./modules/compute"
  vpc_id                = module.network.vpc_id
  public_subnets        = module.network.public_subnets
  private_subnets       = module.network.private_subnets
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  key_name              = var.key_name
  iam_instance_profile  = var.iam_instance_profile

  bastion_ami_id        = var.bastion_ami_id
  bastion_instance_type = var.bastion_instance_type
}


module "dns" {
  source        = "./modules/dns"
  cloudflare_api_token = var.cloudflare_api_token
  domain        = var.domain
  record_name   = var.record_name
  alb_dns_name  = module.compute.alb_dns_name
}

module "ci_cd" {
  source          = "./modules/ci_cd"
  github_token    = var.github_token
  github_owner    = var.github_owner
  github_repo     = var.github_repo
  aws_role_arn    = var.aws_role_arn
  datadog_api_key = var.datadog_api_key
}

module "observability" {
  source                = "./modules/observability"
  datadog_api_key       = var.datadog_api_key
  datadog_app_key       = var.datadog_app_key
  aws_account_id        = var.aws_account_id
  datadog_aws_role_name = var.datadog_aws_role_name
}