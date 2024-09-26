variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-2"
}

variable "db_username" {
  description = "Username for the RDS database"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Password for the RDS database"
  type        = string
  default     = "qwerty123456"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "wp_vm_count" {
  description = "Number EC2 instance type wordpress "
  type        = number
  default     = 2

  validation {
    condition     = var.wp_vm_count > 1
    error_message = "The number of EC2 instances for WordPress must be 2."
  }
}

variable "key_name" {
  description = "The name of the SSH key pair to use for accessing the instances"
  type        = string
}
