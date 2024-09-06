# Security Group que libera as portas 22 (SSH), 80 (HTTP), 443 (HTTPS) e 53 (DNS) no VPC especificado
resource "aws_security_group" "allow_ssh_http_https" {
  name        = "allow_ssh_http_https"
  description = "Allow SSH, HTTP, HTTPS, and DNS traffic"
  vpc_id      = "vpc-095665fcc889de9ca"

  # Regra para permitir tráfego na porta 22 (SSH)
  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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

  # Regra para permitir tráfego na porta 53 (DNS) via TCP
  ingress {
    description = "DNS access (TCP)"
    from_port   = 53
    to_port     = 53
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Regra para permitir tráfego na porta 53 (DNS) via UDP
  ingress {
    description = "DNS access (UDP)"
    from_port   = 53
    to_port     = 53
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Regra para permitir todo o tráfego de saída (egress)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
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
  count         = var.vms_count
  # Nome da chave SSH que será utilizada
  key_name = var.key_name

  # Associando o Security Group à instância
  vpc_security_group_ids = [aws_security_group.allow_ssh_http_https.id]

  tags = {
    Name = "${var.name}-${count.index}"
  }
}
