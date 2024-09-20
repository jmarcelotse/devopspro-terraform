variable "instance_type" {
  description = "Tipo da instância EC2"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Nome da chave SSH"
  default     = "my-ssh-key"
}

variable "ami_id" {
  description = "AMI ID para a instância EC2 (Amazon Linux 2)"
  default     = "ami-085f9c64a9b75eed5"
}
