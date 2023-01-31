# VPC 리소스 생성
resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"
  tags = {
    Name = "myVPC"
  }
}

# Subnet 리소스 생성
resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "mySubnet"
  }
}

# Network Interface 리소스 생성
resource "aws_network_interface" "my_net" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]
  tags = {
    Name = "private_network_interface"
  }
}

# Ubuntu Instance 생성
resource "aws_instance" "ubuntu" {
  ami           = "ami-0225bc2990c54ce9a" # ubuntu 20.04 (64bit, x86)
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.my_net.id
    device_index         = 0
  }
  tags = {
    Name = "myUbuntu"
  }
}