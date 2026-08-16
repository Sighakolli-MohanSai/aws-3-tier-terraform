resource "aws_autoscaling_policy" "cpu_scaling" {
  name                   = "MyTF-CPU-Scaling"
  autoscaling_group_name = aws_autoscaling_group.myasg.name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 50.0
  }
}