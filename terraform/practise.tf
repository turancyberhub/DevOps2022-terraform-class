
### vpc for prod account to host autoscaling groups
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "Vakhob"
  }
}

### public subnet to be used for load balancer

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Vakhob"
  }
}
### internat gateway for autoscaling vpc    

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Vakhob"
  }
}


resource "aws_route_table" "my-rt1" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Vakhob"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.my-rt1.id
}

##==================================================EC2==========================

data "aws_ami" "my_ami" {
  most_recent      = true
  owners           = ["309956199498"]
 
  filter {
    name   = "name"
    values = ["RHEL-8.*_HVM-????????-x86_64-*-Hourly*-GP2"]
  }
 
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.my_ami.id
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id = aws_subnet.subnet1.id
  
  root_block_device {
      volume_size = "12"
      volume_type = "gp3"
      delete_on_termination = true
  }
  vpc_security_group_ids = [aws_security_group.my-sg1.id]
  tags = {
    Name = "Vakhob"
  }
}

resource "aws_security_group" "my-sg1" {
  name        = "allow_tls"
  description = "security group for prod vpc"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Vakhob"
  }
}
