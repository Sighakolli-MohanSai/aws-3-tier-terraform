resource "aws_route_table" "rt1" {
  tags = {
    Name = "Public-RT"
  }
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }
}

resource "aws_route_table_association" "assoc1" {
  route_table_id = aws_route_table.rt1.id
  subnet_id      = aws_subnet.Subnet1.id
}

resource "aws_route_table_association" "assoc2" {
  route_table_id = aws_route_table.rt1.id
  subnet_id      = aws_subnet.Subnet2.id
}