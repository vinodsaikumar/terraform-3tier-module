module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 3"

  name = "${var.unique_prefix}-asg"

  # Launch configuration
  lc_name              = "${var.unique_prefix}-lc"
  create_lc            = true
  image_id             = var.ami
  instance_type        = var.instance_type
  security_groups      = var.security_groups
  key_name             = var.key_name
  iam_instance_profile = var.iam_instance_profile

  associate_public_ip_address = var.associate_public_ip_address

  root_block_device = [{
    volume_size = 50
    encrypted   = true
    volume_type = "gp2"
  }]

  # Auto scaling group
  asg_name            = "${var.unique_prefix}-asg"
  create_asg          = true
  vpc_zone_identifier = var.subnets
  health_check_type   = "EC2"
  min_size            = var.min_size
  max_size            = local.max_size
  desired_capacity    = local.desired_capacity
  target_group_arns   = var.target_group_arns
  user_data           = var.user_data

  tags = local.common_tags
}
