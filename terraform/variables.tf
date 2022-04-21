variable "instance_type" {
  type    = list(any)
  default = ["t2.micro", "t2.small", "t2.nano", "t2.large", "c5.large"]
}

variable "ami" {
  type = map(any)
  default = {
    "red-hat"   = "ami-0b0af3577fe5e3532"
    "linux2"    = "ami-03ededff12e34e59e"
    "ubuntu-20" = "ami-04505e74c0741db8d"
  }
}

variable "iam_user_name" {
  type    = list(any)
  default = ["user1", "user2", "user3", "user4", "user5"]
}

