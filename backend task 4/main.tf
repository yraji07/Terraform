provider "aws" {
    region = "us-west-1"
}
resource "aws_vpc" "ntier" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "ntier"
  }
}