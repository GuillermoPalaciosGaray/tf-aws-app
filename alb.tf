resource "aws_lb" "load_balancer" {
  name                             = var.lb_name 
  internal                         = var.is_internal_lb 
  load_balancer_type               = var.load_balancer_type
  subnets                          = aws_subnet.public_subnets.*.id
  enable_cross_zone_load_balancing = var.is_enabled_cross_zn_lb
  security_groups                  = [aws_security_group.alb_security_group.id]
  idle_timeout                     = 60
  
  access_logs {
    bucket  = aws_s3_bucket.s3_bucket.id
    prefix  = "${var.lb_name}/access-logs"
    enabled = var.is_access_logs_enabled
  }

  tags = merge(
    var.tags,
    {
      "Name" = var.lb_name
    }
  )

}

resource "aws_lb_listener" "listener_target_group" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.target_group.arn
    type             = "forward"
  }
}

resource "aws_lb_target_group" "target_group" {
  name       = var.lb_target_group_name
  port       = "80"
  protocol   = "HTTP"
  vpc_id     = aws_vpc.vpc.id
  slow_start = 0

  health_check {
    enabled           = true
    interval          = "10"
    port              = 80
    protocol          = "HTTP"
    path              = "/"
    healthy_threshold = 2
  }

  tags = merge(
    var.tags,
    {
      "Name" = var.lb_target_group_name
    }
  )
}