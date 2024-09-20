output "instance_public_ip" {
  description = "O endereço IP público da instância EC2"
  value       = aws_instance.example.public_ip
}
