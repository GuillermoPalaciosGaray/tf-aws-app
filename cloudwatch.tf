resource "aws_cloudwatch_metric_alarm" "web_cpu_alarm_up" {
  alarm_name          = "${var.cw_alarm_name}cpu_up"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 60

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.autoscaling_group.name
  }

  alarm_description = "This metric monitors EC2 instance CPU utilization and helps to increasethe number of instances"
  alarm_actions     = [aws_autoscaling_policy.increase_policy.arn]

}

resource "aws_cloudwatch_metric_alarm" "web_cpu_alarm_down" {
  alarm_name          = "${var.cw_alarm_name}cpu_down"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 10

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.autoscaling_group.name
  }

  alarm_description = "This metric monitors EC2 instance CPU utilization and helps to decrease the number of instances"
  alarm_actions     = [aws_autoscaling_policy.decrease_policy.arn]

}