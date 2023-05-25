data "aws_availability_zones" "available_az" {}

data "aws_ami" "amazon_linux" {
  
  most_recent = true
  name_regex  = "^amzn2*"
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
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

data "template_file" "webserver_launch_configuration_user_data" {
  template = file("${path.module}/template/user_data.sh")
}