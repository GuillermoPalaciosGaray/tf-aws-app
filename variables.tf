//----------------------------------------------------------------------
// Shared  Variables
//----------------------------------------------------------------------

variable "region" {
  description = "AWS Region where the resources are going to be deployed."  
  default     = "us-west-2"
  type        = string
}