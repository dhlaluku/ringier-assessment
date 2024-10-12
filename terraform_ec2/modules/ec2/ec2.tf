

resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet
  key_name               = var.keyname
  vpc_security_group_ids = var.security_group_ids

  tags = var.tags
}

resource "aws_iam_role" "ec2" {
  name               = "${var.instance_name}-iam-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "ssm_managed_ec2" {
  role       = aws_iam_role.ec2.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_instance_profile" "ec2" {
  name = "${var.instance_name}-instance-profile"
  role = aws_iam_role.ec2.name
  tags = var.tags
}