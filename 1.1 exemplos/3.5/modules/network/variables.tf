variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "public_subnets" {
  type        = list(string)
  description = "A list of CIDR blocks for public subnets"
}
