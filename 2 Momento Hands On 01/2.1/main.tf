terraform {
  required_version = "~>1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

# Security Group que libera as portas 22 (SSH), 80 (HTTP) e 443 (HTTPS) no VPC especificado
resource "aws_security_group" "allow_ssh_http_https" {
  name        = "allow_ssh_http_https"
  description = "Allow SSH, HTTP, and HTTPS traffic"
  vpc_id      = "vpc-095665fcc889de9ca" # ID do VPC que você especificou

  # Regra para permitir tráfego na porta 22 (SSH)
  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permite acesso de qualquer lugar
  }

  # Regra para permitir tráfego na porta 80 (HTTP)
  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Regra para permitir tráfego na porta 443 (HTTPS)
  ingress {
    description = "HTTPS access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Regra para permitir tráfego na porta 53 (DNS)
  ingress {
    description = "HTTPS access"
    from_port   = 53
    to_port     = 53
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Regra para permitir todo o tráfego de saída (egress)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Permite todo tipo de protocolo
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_http_https"
  }
}

# Recurso AWS Instance com o Security Group associado
resource "aws_instance" "vm-nxt" {
  ami           = var.ami
  instance_type = var.instance_type

  # Nome da chave SSH que será utilizada
  key_name = var.key_name # Nome sem o sufixo .pem

  # Associando o Security Group à instância
  vpc_security_group_ids = [aws_security_group.allow_ssh_http_https.id]

  tags = {
    Name = var.name
  }
}

variable "ami" {
  default = "ami-085f9c64a9b75eed5"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "region" {
  default = "us-east-2"
}

variable "key_name" {
  default = "terraform"
}

variable "name" {
  default = "nxt"
}

# Output para mostrar o IP público da instância
output "instance_public_ip" {
  description = "O endereço IP público da instância EC2"
  value       = aws_instance.vm-nxt.public_ip
}
