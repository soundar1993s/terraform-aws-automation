variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "guvi-project03"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}