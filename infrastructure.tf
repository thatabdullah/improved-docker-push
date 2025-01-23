provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    region = var.region
}
resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/24"
  tags = {
    name = "temp-vpc"
  }
}
resource "aws_subnet" "my-subnet" {
  cidr_block = "10.0.0.0/25"
  vpc_id = aws_vpc.my-vpc.id
  availability_zone = "${var.region}a"
  tags = {
    name = "temp-public-subnet"
  }
}
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.my-vpc.id
}


resource "aws_route_table" "my-route-table" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }

  tags = {
    Name = "temp-route-table"
  }
}

resource "aws_route_table_association" "RT-association" {
  subnet_id = aws_subnet.my-subnet.id
  route_table_id = aws_route_table.my-route-table.id
}

resource "aws_security_group" "my-security-group" {
  name  = "temp-SG"
  description = "improved ci-cd project"
  vpc_id = aws_vpc.my-vpc.id

  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress  {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "temp-SG"
  }
}


resource "aws_instance" "my-ec2" {  
  ami           = "ami-0cb91c7de36eed2cb"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.my-subnet.id
  associate_public_ip_address = true
  key_name    = var.key_name
  vpc_security_group_ids = [aws_security_group.my-security-group.id]
  user_data = base64encode(templatefile("instance.tpl", {}))
   
  tags = {
    Name = "temp-ec2"
  }
}
output "ip" {
    value = aws_instance.my-ec2.public_ip
  
}