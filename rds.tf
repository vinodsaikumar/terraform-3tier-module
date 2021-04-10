module "app_db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 2"

  identifier                      = "${var.unique_prefix}-db"
  engine                          = "mariadb"
  engine_version                  = "10.4.13"
  parameter_group_name            = "${var.unique_prefix}-param-group"
  parameter_group_use_name_prefix = false
  option_group_name               = "${var.unique_prefix}-option-group"
  option_group_use_name_prefix    = false
  instance_class                  = var.rds_class
  allocated_storage               = var.rds_storage

  username               = var.rds_root_username
  password               = var.rds_root_password
  port                   = 3306
  multi_az               = true
  vpc_security_group_ids = [module.security_group_rds_app.this_security_group_id]

  # Parameter group
  family                    = "mariadb10.4"
  major_engine_version      = "10.4"
  monitoring_interval       = 30
  storage_encrypted         = true
  final_snapshot_identifier = "final-snapshot"
  ca_cert_identifier        = "rds-ca-2019"

  create_db_subnet_group = false
  db_subnet_group_name   = module.vpc.rds_subnet_group
  subnet_ids             = module.vpc.persistence_subnets

  tags = local.common_tags
}

module "security_group_rds_app" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "${var.unique_prefix}-sg-app"
  description = "Security group for usage with the RDS instance"
  vpc_id      = var.vpc_id

  use_name_prefix = false

  ingress_with_source_security_group_id = {
    rule        = "mysql-tcp"
    description = "access"
    # SG ID etc can go in here
  }

  egress_rules = ["all-all"]
}
