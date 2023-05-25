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
  key_name                    = aws_key_pair.aws_autogenerated_key_pair.key_name
  user_data                   = data.template_file.webserver_launch_configuration_user_data.rendered

}

resource "aws_autoscaling_group" "autoscaling_group" {
  name                 = var.autoscaling_group_name
  max_size             = var.max_instance_size
  min_size             = var.min_instance_size
  vpc_zone_identifier  = tolist(aws_subnet.public_subnets.*.id) 
  launch_configuration = aws_launch_configuration.launch_configuration.name
  health_check_type    = var.health_check_type
  target_group_arns    = [aws_lb_target_group.target_group.arn]

}

resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.autoscaling_group.id
  alb_target_group_arn   = aws_lb_target_group.target_group.arn
}

resource "aws_autoscaling_policy" "increase_policy" {
  name                   = "Increase_Policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 60
  autoscaling_group_name = aws_autoscaling_group.autoscaling_group.name
}

resource "aws_autoscaling_policy" "decrease_policy" {
  name                   = "Decrease_Policy"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.autoscaling_group.name
}