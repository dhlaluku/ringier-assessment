
locals {
  vpc_id  = data.aws_vpc.default.id
  keyname = data.aws_key_pair.key_name.key_name

}

resource "aws_security_group" "security" {
  name        = "allow-ssh"
  description = "Allow SSH access from all networks"

  vpc_id = data.aws_vpc.default.id

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "ec2-instance" {
  count              = var.is_graviton ? 0 : 1
  source             = "./modules/ec2"
  instance_type      = var.instance_type
  instance_name      = var.instance_name
  ami_id             = data.aws_ami.ami.id
  vpc                = data.aws_vpc.default.id
  subnet             = data.aws_subnet.subnet_id.id
  keyname            = data.aws_key_pair.key_name.key_name
  security_group_ids = [aws_security_group.security.id]

  tags = {
    "Instance-type" = "AMD"
    "Terraform"     = "True"
    Name            = "${var.instance_name}"
  }
}


module "ec2-instance-graviton" {
  count              = var.is_graviton ? 1 : 0
  source             = "./modules/ec2"
  instance_type      = "t4g.nano"
  ami_id             = data.aws_ami.ami_arm.id
  vpc                = data.aws_vpc.default.id
  subnet             = data.aws_subnet.subnet_id.id
  keyname            = data.aws_key_pair.key_name.key_name
  security_group_ids = [aws_security_group.security.id]
  tags = {
    Name            = "${var.instance_name}-graviton"
    "Instance-type" = "ARM"
    "Terraform"     = "True"
  }
}
