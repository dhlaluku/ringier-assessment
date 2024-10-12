
data "aws_caller_identity" "current" {}

data "aws_vpc" "default" {
  id = var.vpc
}

data "aws_subnet" "subnet_id" {
  id = var.subnet
}

data "aws_key_pair" "key_name" {
  key_name           = var.keyname
  include_public_key = true
}

data "aws_ami" "ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "ami_arm" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*"]
  }

  filter {
    name   = "architecture"
    values = ["arm64"]
  }
}