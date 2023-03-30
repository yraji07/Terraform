provider "aws" {
  region = var.region
}

# Create a VPC
resource "aws_vpc" "vpc_subnet" {
  cidr_block = var.vpc_subnet
  tags = {
    Name = "vpc_subnet"
  }
}
# Create a subnet
resource "aws_subnet" "Subnets" {
  count      = length(var.Subnets)
  vpc_id     = aws_vpc.vpc_subnet.id
  cidr_block = var.Subnets[count.index]
  tags = {
    Name = var.subnet_names[count.index]
  }
}
# Create a internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_subnet.id

  tags = {
    Name = "igw"
  }
}

# Create route table
resource "aws_route_table" "publicRT" {
  vpc_id = aws_vpc.vpc_subnet.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "route"
  }
}





