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
  description = "Name of the Public Security Group for EC2"
  type        = string
  default     = "public_ec2_sg"
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

variable "is_access_logs_enabled" {
  description = "Indicate wheter load balancer access logs are enabled."
  type        = bool
  default     = true
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

variable "launch_template_name" {
  description = "The name for launch template."
  type        = string
  default     = "web-lc"
}

variable "instance_type" {
  description = "The instance type for EC2 instances."
  type        = string
  default     = "t2.micro"
}

variable "device_name" {
  description = "Storage device name."
  type        = string
  default     =  "/dev/xvda"
}

variable "volume_size" {
  description = "Size of root EBS volume of the container instance."
  type        = number
  default     = 8
}

variable "volume_type" {
  description = "Volume type of the container instance."
  type        = string
  default     = "gp2"
}

variable "is_delete_on_termination" {
  description = "Indicate whether the volume should be destroyed on instance termination."
  type    = bool
  default = true
}

variable "is_volume_encrypted" {
  description = "Indicate whether the EBS encryption is enabeld on the volume."
  type    = bool
  default = true
}

variable "associate_public_ip_address" {
  description = "Indicate wheter associate_public_ip_address"
  type    = bool
  default = true
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
  default     = 2
}

variable "health_check_type" {
  description = "Auto Scaling Group health Check Type."
  type    = string
  default = "EC2"
}

//----------------------------------------------------------------------
// CloudWatch Variables
//----------------------------------------------------------------------

variable "cw_alarm_name" {
  description = "Cloud Watch Alarm Name."
  type        = string
  default     = "cloudwatch_alarm"
}

//----------------------------------------------------------------------
// S3 Bucket Variables
//----------------------------------------------------------------------

variable "s3_bucket_name"{
    default = "lb-access-logs-s3"
    type    = string
}

variable "acl"{
    default = "private"
    type    = string
}

variable "expiration_days"{
    default = 30
    type    = number
}

variable "force_destroy"{
    default = false
    type    = bool
}