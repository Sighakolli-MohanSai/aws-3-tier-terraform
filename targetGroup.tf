resource "aws_lb_target_group" "mytg" {
  name     = "MyTF-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.myvpc.id

  health_check {
    enabled  = true
    protocol = "HTTP"
    port     = "traffic-port"
    path     = "/"
  }

  tags = {
    Name = "MyTF-TG"
  }
}