# Utilizar chave SSH existente
resource "aws_key_pair" "existing_key" {
  key_name   = var.key_name
  public_key = file("/home/jmarcelotse/.ssh/id_rsa.pub")
}

# Criar uma instância EC2
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.existing_key.key_name

  tags = {
    Name = "Terraform-Instance"
  }

  # Definir um security group básico para liberar SSH
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
}

# Definir um Security Group para liberar portas
resource "aws_security_group" "instance_sg" {
  name        = "instance_sg"
  description = "Security Group for SSH access"

  ingress {
    from_port   = 22
    to_port     = 22
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
