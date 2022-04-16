resource "aws_instance" "web" {
    ami = var.ami
    instance_type = var.instance_type
}

resource "aws_iam_user" "test_user" {
    name = var.iam_user_name
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