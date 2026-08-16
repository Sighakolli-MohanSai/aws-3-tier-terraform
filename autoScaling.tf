resource "aws_autoscaling_group" "myasg" {
  name             = "MyTF-App-ASG"
  min_size         = 2
  max_size         = 4
  desired_capacity = 2

  vpc_zone_identifier = [
    aws_subnet.Subnet3.id,
    aws_subnet.Subnet4.id
  ]

  target_group_arns = [
    aws_lb_target_group.mytg.arn
  ]

  launch_template {
    id      = aws_launch_template.mylt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "Terraform-App-Server"
    propagate_at_launch = true
  }
}