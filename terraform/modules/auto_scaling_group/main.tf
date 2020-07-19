resource "aws_autoscaling_group" "autoscaling_group" {
  count = var.create_asg ? 1 : 0

  name_prefix          = "asg"
  vpc_zone_identifier  = var.subnet_ids
  launch_configuration = var.launch_configuration
  min_size             = var.cluster_minimum_size
  max_size             = var.cluster_maximum_size
  desired_capacity     = var.cluster_desired_capacity

  lifecycle {
    create_before_destroy = true
  }
}
