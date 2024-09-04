variable "ami" {
  description = "ID da AMI utilizada para a instância EC2"
  default     = "ami-085f9c64a9b75eed5"
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  default     = "t2.micro"
}

variable "region" {
  description = "Região AWS onde os recursos serão provisionados"
  default     = "us-east-2"
}

variable "key_name" {
  description = "Nome do par de chaves SSH"
  default     = "terraform"
}

variable "name" {
  description = "Nome da instância EC2"
  default     = "nxt"
}
