variable "vpc_cidr" {
  description = "O bloco CIDR para a VPC"
  type        = string
}

variable "public_subnets" {
  description = "Lista de blocos CIDR de sub-redes públicas"
  type        = list(string)
}
