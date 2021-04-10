module "app" {
  source = "./modules/compute"

  unique_prefix     = var.unique_prefix
  environment       = var.environment
  product           = var.product
  ami               = var.app_ami
  security_groups   = module.app_access.this_security_group_id
  target_group_arns = module.app_lb.target_group_arns
  instance_type     = "t3.nano"
  subnets           = var.private_subnets
  user_data         = local.user_data
}

module "app_access" {
  # The SG resource setting in here 
}

module "app_lb" {
  # The NLB or ALB setting in here for application
}

module "web" {
  source = "./modules/compute"

  unique_prefix     = var.unique_prefix
  environment       = var.environment
  product           = var.product
  ami               = var.web_ami
  security_groups   = module.web_access.this_security_group_id
  target_group_arns = module.web_lb.target_group_arns
  instance_type     = "t3.nano"
  subnets           = var.private_subnets
  user_data         = local.user_data
}

module "web_access" {
  # The SG resource setting in here 
}

module "web_lb" {
  # The NLB or ALB setting in here for web
}
