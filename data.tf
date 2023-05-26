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

data "aws_elb_service_account" "main" {}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "s3_bucket_lb_write" {
  policy_id = "s3_bucket_lb_logs"

  statement {
    actions = [
      "s3:PutObject",
    ]
    effect = "Allow"
    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}/*/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
    ]

    principals {
      identifiers = [data.aws_elb_service_account.main.arn]
      type        = "AWS"
    }
  }

  statement {
    actions = [
      "s3:PutObject"
    ]
    effect = "Allow"
    resources = ["${aws_s3_bucket.s3_bucket.arn}/*"]
    principals {
      identifiers = ["delivery.logs.amazonaws.com"]
      type        = "Service"
    }
  }


  statement {
    actions = [
      "s3:GetBucketAcl"
    ]
    effect = "Allow"
    resources = [aws_s3_bucket.s3_bucket.arn]
    principals {
      identifiers = ["delivery.logs.amazonaws.com"]
      type        = "Service"
    }
  }
}