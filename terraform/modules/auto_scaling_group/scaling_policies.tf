#Autoscaling Policy
resource "aws_autoscaling_policy" "this_up" {
  name                   = var.autoscaling_policy_name_up
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = concat(aws_autoscaling_group.autoscaling_group.*.name, [""])[0]
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
    AutoScalingGroupName = concat(aws_autoscaling_group.autoscaling_group.*.name, [""])[0]
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
  autoscaling_group_name = concat(aws_autoscaling_group.autoscaling_group.*.name, [""])[0]
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
    AutoScalingGroupName = concat(aws_autoscaling_group.autoscaling_group.*.name, [""])[0]
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.this_down.arn]
}
