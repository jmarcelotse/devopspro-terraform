# Output para mostrar o IP público da instância EC2
output "instance_public_ip" {
  description = "O endereço IP público da instância EC2"
  value       = aws_instance.vm-nxt.public_ip
}
