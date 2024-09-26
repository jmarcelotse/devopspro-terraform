output "lb_dns_name" {
  description = "DNS Name of the load balancer"
  value       = aws_lb.wp_lb.dns_name
}

output "database_username" {
  description = "Username for the RDS database"
  value       = aws_db_instance.wp_mysql.username
  sensitive   = true # Adicione esta linha
}

output "database_endpoint" {
  description = "Endpoint for the RDS database"
  value       = aws_db_instance.wp_mysql.endpoint
  sensitive   = true # Adicione esta linha
}

output "database_port" {
  description = "Port for the RDS database"
  value       = aws_db_instance.wp_mysql.port
}
