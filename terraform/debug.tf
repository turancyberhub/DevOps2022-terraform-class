/*
data "aws_ami" "example" {
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

resource "aws_instance" "user-data" {
    ami = data.aws_ami.example.id
    instance_type = "t2.micro"
    vpc_security_group_ids = ["sg-0159d4a9bb54ac398"]
    key_name = "devops_spring"
    associate_public_ip_address = true
    user_data = "${file("user-data.sh")}"
}

output "ec2_public_ip" {
    value = aws_instance.user-data.public_ip
}
*/