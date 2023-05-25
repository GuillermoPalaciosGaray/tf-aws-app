resource "aws_security_group" "alb_security_group" {
  name        = var.alb_sg_name
  description = "Allow Traffic from Public Internet"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
      "Name" = var.alb_sg_name
    }
  )
}
resource "aws_security_group" "ec2_security_group" {
  name        = var.ec2_sg_name 
  description = "Private EC2 security group"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "TCP"
    security_groups = [aws_security_group.alb_security_group.id]
  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "TCP"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
      "Name" = var.ec2_sg_name
    }
  )
}