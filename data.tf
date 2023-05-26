data "aws_availability_zones" "available_az" {}

data "aws_ami" "amazon_linux" {
  
  most_recent = true
  name_regex  = "^al2023-ami-2023*"
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami*-x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name = "architecture"
    values = ["x86_64"]
  }
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    sid     = ""
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "policy_document" {
  statement {
    effect = "Allow"

    actions = [
      "ec2:*",
      "ssm:*"
    ]

    resources = ["*"]
  }
}