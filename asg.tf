resource "aws_launch_configuration" "launch_configuration" {
  name_prefix               = var.launch_configuration_name

  root_block_device {
    volume_size = var.volume_size
    volume_type = "gp2"
  }

  image_id                    = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  iam_instance_profile        = aws_iam_instance_profile.instance_profile.name
  security_groups             = [aws_security_group.ec2_security_group.id]
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_name
  user_data                   = var.user_data
}
