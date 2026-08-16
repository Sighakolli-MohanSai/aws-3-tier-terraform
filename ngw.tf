resource "aws_nat_gateway" "myngw" {
  tags = {
    Name = "MyTF-NGW"
  }
  allocation_id     = aws_eip.myeip.id
  subnet_id         = aws_subnet.Subnet1.id
  connectivity_type = "public"
}