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