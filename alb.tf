resource "aws_lb" "myalb" {
  name               = "MyTF-Lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]

  subnets = [
    aws_subnet.Subnet1.id,
    aws_subnet.Subnet2.id
  ]

  tags = {
    Name = "MyTF-ALB"
  }
}