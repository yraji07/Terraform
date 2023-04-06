# Create keypair in downloads system public key already exist give its name & key 
provider "aws" {
  region = "us-west-1"
}
# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "192.168.0.0/16"

  tags = {
    Name = "rajivpc"
  }
}
# Create subnet
resource "aws_subnet" "my_subnets" {
  count             = length(var.subnet_names)
  cidr_block        = var.cidr_block[count.index]
  availability_zone = "${var.region}${var.subnet_azs[count.index]}" # availability_zone = "${var.region}${var.subnet_azs[count.index]}"
  vpc_id            = aws_vpc.my_vpc.id
  depends_on = [
    aws_vpc.my_vpc
  ]
  tags = {
    Name = var.subnet_names[count.index]
  }

}
# Create internet_gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "newigw"
  }
  depends_on = [
    aws_vpc.my_vpc
  ]
}
# Create route_table
resource "aws_route_table" "privateroute" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "privateroute"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

}

# create route association to connect 
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.my_subnets[0].id
  route_table_id = aws_route_table.privateroute.id
}
# create security group & allow the ports
resource "aws_security_group" "sg_group" {
  name        = "sg_group"
  description = "Allow the security group"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "web"
  }

}
# create ec2 instancce give all the necessary 
resource "aws_instance" "myec2instance" {
  ami                         = "ami-014d05e6b24240371"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = "pubkey"                    # aws_key_pair.pubkey.id
  subnet_id                   = aws_subnet.my_subnets[0].id # aws_subnet.subnets[0].id
  vpc_security_group_ids      = [aws_security_group.sg_group.id]
  user_data                   = filebase64("shellscript.sh")

  tags = {
    Name = "my_instance"
  }

}

# file("C:/tmp/loadbalancer/apache.sh")
