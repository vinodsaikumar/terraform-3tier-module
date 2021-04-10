module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.unique_prefix}-vpc"
  cidr = var.cidr
  # Assuming its EU Zone
  azs              = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  public_subnets   = cidrsubnets(var.cidr, 4, 4, 4)
  private_subnets  = cidrsubnets(var.cidr, 4, 4, 4)
  database_subnets = cidrsubnets(var.cidr, 4, 4, 4)

  enable_nat_gateway = true

  propagate_private_route_tables_vgw = true
  propagate_public_route_tables_vgw  = true

  create_database_subnet_group           = true
  create_database_internet_gateway_route = false
  create_database_nat_gateway_route      = false
  create_database_subnet_route_table     = true

  public_dedicated_network_acl = true
  public_inbound_acl_rules     = local.public_inbound_acl_rules
  public_outbound_acl_rules    = local.public_outbound_acl_rules

  private_dedicated_network_acl = true
  private_inbound_acl_rules     = local.private_inbound_acl_rules
  private_outbound_acl_rules    = local.private_outbound_acl_rules

  database_dedicated_network_acl = true
  database_inbound_acl_rules     = local.persistence_inbound_acl_rules
  database_outbound_acl_rules    = local.persistence_outbound_acl_rules

  tags                = local.common_tags
  public_subnet_tags  = local.common_tags
  private_subnet_tags = local.common_tags
}
