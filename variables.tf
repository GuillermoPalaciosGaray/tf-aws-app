//----------------------------------------------------------------------
// Shared  Variables
//----------------------------------------------------------------------

variable "region" {
  description = "AWS Region where the resources are going to be deployed."  
  default     = "us-east-1"
  type        = string
}