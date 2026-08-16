resource "aws_eip" "myeip" {
  domain = "vpc"

  tags = {
    Name = "MyTF-NAT-EIP"
  }
}