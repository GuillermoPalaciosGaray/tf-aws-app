//----------------------------------------------------------------------
// Shared  Variables
//----------------------------------------------------------------------

variable "region" {
  description = "AWS Region where the resources are going to be deployed."  
  default     = "us-east-1"
  type        = string
}

variable "tags" {
  description = "Tags to propogate to all supported resources"
  type        = map(string)
  default = {
    "terraform_managed" = "true"
  }
}

//----------------------------------------------------------------------
// VPC  Variables
//----------------------------------------------------------------------
variable "vpc_name" {
  description = "Name of the VPC to create"
  type        = string
  default     = "Primary VPC"
}

variable "vpc_cidr" {
  description = "CIDR associated with the VPC to be created"
  type        = string
  default     = "10.1.0.0/16"
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "public_subnet_size" {
  description = "The size of the Public subnet."
  type        = number
  default     = 24
}

variable "az_count" {
  description = "The number of AZs to deploy infrastructure to"
  type        = number
  default     = 2
}


//----------------------------------------------------------------------
// Security Groups Variables
//----------------------------------------------------------------------

variable "alb_sg_name" {
  description = "Name of the ALB Security Group"
  type        = string
  default     = "alb_security_group"
}

variable "ec2_sg_name" {
  description = "Name of the Private Security Group for EC2"
  type        = string
  default     = "private_ec2_sg"
}

//----------------------------------------------------------------------
// Load Balancer Variables
//----------------------------------------------------------------------
variable "lb_name" {
  description = "Name of load balancer."
  type        = string
  default     = "ext-alb"
}

variable "load_balancer_type" {
  description = "Indicate the type of load balancer."
  type        = string
  default     = "application"
}

variable "is_internal_lb" {
  description = "Indicate wheter load balancer is internal."
  type        = bool
  default     = false
}

variable "is_enabled_cross_zn_lb" {
  description = "Indicate wheter cross zone load balancing is enabled."
  type        = bool
  default     = true
}

variable "lb_target_group_name" {
  description = "Load balancer target group name."
  type        = string
  default     = "tg-ext-alb-asg"
}

//----------------------------------------------------------------------
// Key Pair Variables
//----------------------------------------------------------------------
variable "aws_key_pair_name" {
    description = "AWS EC2 Key pair needed to be associated with EC2."
    type        =  string
    default     = "terraform-managed-key"
}

//----------------------------------------------------------------------
// Auto Scaling Group Variables
//----------------------------------------------------------------------

variable "launch_configuration_name" {
  description = "The name for launch configuration."
  type        = string
  default     = "web-lc"
}

variable "instance_type" {
  description = "The instance type for EC2 instances."
  type        = string
  default     = "t3.small"
}

variable "volume_size" {
  description = "Size of root EBS volume of the container instance."
  type        = number
  default     = 8
}

variable "associate_public_ip_address" {
  description = "Indicate wheter associate_public_ip_address"
  type    = bool
  default = false
}

variable "autoscaling_group_name" {
  description = "The name for the autoscaling group for the web."
  default     = "web-asg"
}

variable "max_instance_size" {
  description = "The max instances number for the webserver."
  default     = 4
}

variable "min_instance_size" {
  description = "The min instance number for the webserver."
  default     = 1
}

variable "health_check_type" {
  description = "Auto Scaling Group health Check Type."
  type    = string
  default = "EC2"
}