resource "aws_vpc" "myvpc" {
  tags = {
    Name = "MyTF-VPC"
  }
  cidr_block           = "10.0.0.0/22"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
}