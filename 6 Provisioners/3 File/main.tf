terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region     = "us-east-2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "vm_aula" {
  ami           = "ami-0c55b159cbfafe1f0" # Ubuntu 22.04 em us-east-2
  instance_type = "t2.micro"
  key_name      = var.key_name

  # Definindo um security group básico para permitir SSH e HTTP
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = "maquina-aula"
  }

  # Definindo a conexão SSH
  connection {
    type        = "ssh"
    user        = "ubuntu"                       # Usuário padrão para Ubuntu
    private_key = file(var.private_key_path)     # Carregando a chave privada
    host        = aws_instance.vm_aula.public_ip # Usando o IP público da instância
  }

  # Provisioner para transferir arquivo
  provisioner "file" {
    source      = "arquivo-install.sh"
    destination = "/home/ubuntu/arquivo-install.sh" # Ajuste o caminho para o usuário 'ubuntu'
  }

  # Provisionamento remoto via SSH
  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/arquivo-install.sh", # Correção no caminho
      "/home/ubuntu/arquivo-install.sh"
    ]
  }
}

resource "aws_security_group" "sg" {
  name        = "sg_maquina_aula"
  description = "Permitir acesso SSH e HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
