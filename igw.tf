resource "aws_internet_gateway" "myigw" {
  tags = {
    Name = "MyTF-IGW"
  }
  vpc_id = aws_vpc.myvpc.id
}