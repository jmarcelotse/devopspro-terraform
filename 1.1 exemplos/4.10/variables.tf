variable "region" {
  description = "A região AWS para implantar"
  default     = "us-east-2"
}

variable "environment" {
  description = "Nome do ambiente"
  type        = string
  default     = "dev"
}

variable "subnet_number" {
  description = "Número da sub-rede"
  type        = number
  default     = 1
}

variable "ingress_rules" {
  description = "Regras de ingresso para o grupo de segurança"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}
