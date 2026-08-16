resource "aws_subnet" "Subnet1" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "Public-SN-1"
  }
  availability_zone       = "us-east-2a"
  cidr_block              = "10.0.0.0/25"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "Subnet2" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "Public-SN-2"
  }
  availability_zone       = "us-east-2b"
  cidr_block              = "10.0.0.128/25"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "Subnet3" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "Private-SN-1"
  }
  availability_zone = "us-east-2a"
  cidr_block        = "10.0.1.0/25"
}

resource "aws_subnet" "Subnet4" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "Private-SN-2"
  }
  availability_zone = "us-east-2b"
  cidr_block        = "10.0.1.128/25"
}