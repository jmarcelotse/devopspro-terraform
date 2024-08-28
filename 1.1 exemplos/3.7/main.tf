variable "instance_count" {
  description = "Number of instances to create"
  default     = 2
}

variable "enable_monitoring" {
  description = "Enable detailed monitoring for the instances"
  default     = true
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "web_server" {
  count         = var.instance_count
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  monitoring = var.enable_monitoring

  tags = {
    Name = "WebServerInstance-${count.index + 1}"
  }
}

output "instance_ids" {
  value = aws_instance.web_server[*].id
}
