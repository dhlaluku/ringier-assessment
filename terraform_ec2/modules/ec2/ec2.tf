

resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet
  key_name               = var.keyname
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = var.instance_name
  }
}
