resource "aws_route_table" "rt2" {
  tags = {
    Name = "Private-RT"
  }
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.myngw.id
  }
}

resource "aws_route_table_association" "assoc3" {
  route_table_id = aws_route_table.rt2.id
  subnet_id      = aws_subnet.Subnet3.id
}

resource "aws_route_table_association" "assoc4" {
  route_table_id = aws_route_table.rt2.id
  subnet_id      = aws_subnet.Subnet4.id
}