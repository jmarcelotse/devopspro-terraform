provider "aws" {
  region = "us-east-2"
}

variable "create_backup_instance" {
  description = "Whether to create a backup instance"
  type        = bool
  default     = false
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "WebServerInstance"
  }
}

resource "aws_instance" "backup_server" {
  count         = var.create_backup_instance ? 1 : 0
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "BackupServerInstance"
  }
}

output "web_server_id" {
  value = aws_instance.web_server.id
}

output "backup_server_id" {
  value = aws_instance.backup_server.*.id
}
