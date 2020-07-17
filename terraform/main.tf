data "template_file" "user_data" {
  template = "${file("${path.module}/templates/user_data.sh")}"

  vars = {
    ecs_cluster = "${aws_ecs_cluster.this.name}"
  }
}

#Cluster
resource "aws_ecs_cluster" "this" {
  name = var.cluster_name

  tags = {
    Name = var.cluster_name
  }
}

#Launch Configuration
resource "aws_launch_configuration" "this" {
  name                 = var.launch_configuration_name
  image_id             = var.image_id
  instance_type        = var.instance_type
  iam_instance_profile = var.iam_instance_profile
  user_data            = data.template_file.user_data.rendered
  security_groups      = [aws_security_group.this.id]
  key_name             = var.key_name

  root_block_device {
    volume_size = var.instance_root_volume_size
    volume_type = "gp2"
  }

  lifecycle {
    create_before_destroy = false
  }
}

##Autoscaling Group
resource "aws_autoscaling_group" "this" {
  name                      = var.autoscaling_group_name
  max_size                  = var.max_num_instances
  min_size                  = var.min_num_instances
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = var.desired_capacity
  force_delete              = true
  launch_configuration      = aws_launch_configuration.this.name
  vpc_zone_identifier       = [aws_subnet.private-1a.id, aws_subnet.private-1b.id, aws_subnet.private-1c.id]
}

#Autoscaling Policy
resource "aws_autoscaling_policy" "this_up" {
  name                   = var.autoscaling_policy_name_up
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.this.name
}

resource "aws_cloudwatch_metric_alarm" "this_up" {
  alarm_name          = var.alarm_name_up
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = var.max_threshold

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.this.name
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.this_up.arn]
}

#Autoscaling Down Policy
resource "aws_autoscaling_policy" "this_down" {
  name                   = var.autoscaling_policy_name_down
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.this.name
}

resource "aws_cloudwatch_metric_alarm" "this_down" {
  alarm_name          = var.alarm_name_down
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = var.min_threshold

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.this.name
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.this_down.arn]
}

resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCvwYJkMimr73hlpfFW9DbtOqSw/LDA0+wBDWcR2T1JYRHATFTfLiwNg6zAObNkLHyQ/LsX3oYOyognaoV0MfE88DRntaCMFHxdRLTWxosrxGWxw3mxmj53+AAKzv81zhcZUeCP+sqZ/+mj9OWTCSsJ8FKQszrNOHVtNF1dqvXg5+RFB45EQrAWYx3YqKcdCxCQPJcIQc0ShbQVx1NMpJ4niZpIfI/IszTzPhd9PgMPgoxGSPzUkK7SzlyiojfmIPUckTLkE/u9UZJDeFKb3mJJ7KIicH5J3MNXpCNukxBaDQhoZ4OXgR8Z0yRgCugry+QBzGWQErb7hS7WE+7jVFer"
}
