data "aws_ami" "ecs_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-*-amazon-ecs-optimized"]
  }
}

data "template_file" "user_data" {
  template = "${file("${path.module}/templates/user_data.sh")}"

  vars = {
    ecs_cluster = "${module.ecs_cluster.ecs_cluster_name}"
  }
}

module "ecs_cluster" {
  source = "../modules/ecs_cluster"

  create_ecs_cluster = var.create_ecs_cluster
  ecs_cluster_name   = "${var.project_name}-${var.environment}-ecs-${var.aws_region}"

  tags = {
    "environment" = var.environment
    "project"     = var.project_name
  }
}

module "vpc" {
  source = "../modules/vpc"

  create_vpc = var.create_vpc
  vpc_name   = "${var.project_name}-${var.environment}-vpc-${var.aws_region}"
  aws_region = var.aws_region

  cidr            = var.cidr
  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
}

module "sg" {
  source = "../modules/security_group"

  security_group_name = "${var.project_name}-${var.environment}-sg-${var.aws_region}"
  vpc_id              = module.vpc.vpc_id

}

module "lc" {
  source = "../modules/launch_configuration"

  name_prefix          = var.name_prefix
  image_id             = data.aws_ami.ecs_ami.id
  instance_type        = var.instance_type
  security_groups      = [module.sg.security_group_id]
  user_data            = data.template_file.user_data.rendered
  iam_instance_profile = module.iam_role.this_iam_instance_profile_id

  root_block_device = [
    {
      volume_size           = "30"
      volume_type           = "gp2"
      delete_on_termination = true
    },
  ]
}

module "asg" {
  source = "../modules/auto_scaling_group"

  name_prefix              = var.name_prefix
  cluster_minimum_size     = var.cluster_minimum_size
  cluster_maximum_size     = var.cluster_maximum_size
  cluster_desired_capacity = var.cluster_desired_capacity
  launch_configuration     = module.lc.launch_configuration_id
  subnet_ids               = module.vpc.private_subnets
}

########################################################
module "iam_role" {
  source = "../modules/iam"

  name = "${var.project_name}-${var.environment}-instance_profile-${var.aws_region}"
}
