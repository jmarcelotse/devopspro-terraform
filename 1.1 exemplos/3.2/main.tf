variable "region" {
  default = "us-east-2"
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "WebServerInstance"
  }
}
