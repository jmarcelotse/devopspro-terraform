locals {
  instance_name = "web-server-${var.environment}"
  subnet_cidr   = "10.0.${var.subnet_number}.0/24"
}
