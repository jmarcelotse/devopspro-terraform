resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "WebServerInstance"
  }
}

output "instance_ip" {
  value = aws_instance.web_server.public_ip
}
