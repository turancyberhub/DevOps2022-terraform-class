provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

provider "aws" {
  region  = "us-east-2"
  profile = "default"
  alias   = "ohio"
}

provider "aws" {
  region  = "us-west-1"
  profile = "default"
  alias   = "california"
}

terraform {
  backend "s3" {
    bucket = "devops2022-terraform-state-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}