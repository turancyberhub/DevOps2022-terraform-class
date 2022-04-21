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
resource "aws_instance" "web" {
    ami = data.aws_ami.example.id
    instance_type = var.instance_type[0]
}

resource "aws_iam_user" "test_user" {
    name = "iam_user_name.${count.index}"
    #name = var.iam_user_name[count.index]
    count = 3
    tags = {
        Owner = "Vakhob"
    }
}


resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/users/"
}

resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.test_user.name
  ]

  group = aws_iam_group.developers.name
}


resource "aws_s3_bucket" "b" {
  bucket = "test-jasmin-remote-state-bucket"

  tags = {
    Name        = "Jasmin"
    Environment = "Jasmin"
  }
}

resource "aws_instance" "imported_1" {
  ami = "ami-03ededff12e34e59e"
  instance_type = "t2.micro"
}


resource "aws_instance" "ohio" {
  ami = "ami-0c7478fd229861c57"
  instance_type = "t2.micro"
  provider = aws.ohio
}
*/