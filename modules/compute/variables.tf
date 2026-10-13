variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for EC2"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "user_data" {
  description = "EC2 user data script"
  type        = string
}
variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket accessible by EC2"
  type        = string
}