resource "aws_cloudwatch_metric_alarm" "alb_5xx" {
  alarm_name          = "MyTF-ALB-5xx-Errors"
  alarm_description   = "Alarm when the Application Load Balancer returns 5xx errors"
  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2
  metric_name        = "HTTPCode_ELB_5XX_Count"
  namespace         = "AWS/ApplicationELB"
  period            = 60
  statistic         = "Sum"
  threshold         = 5

  dimensions = {
    LoadBalancer = aws_lb.myalb.arn_suffix
  }

  treat_missing_data = "notBreaching"
}