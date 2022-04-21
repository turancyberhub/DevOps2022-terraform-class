/*
provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "myec2" {
  ami           = "ami-0b0af3577fe5e3532"
  instance_type = "t2.micro"
}

output "my_ec2_public_ip" {
  value = aws_instance.myec2.public_ip
}

resource "aws_security_group" "my_sg" {
  name        = "tch_sg"
  description = "first sg created by terraform"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = var.protocol
    cidr_blocks = [var.cidr_blocks]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = var.protocol
    cidr_blocks = [var.cidr_blocks]
  }

  egress {
    from_port   = 8080
    to_port     = 8080
    protocol    = var.protocol
    cidr_blocks = [var.cidr_blocks]
  }
}

variable "cidr_blocks" {
  default = "192.168.1.0/24"
}

variable "protocol" {

}

output "my_sg_id" {
  value = aws_security_group.my_sg.id
}
*/
