provider "aws" {
  region = "us-east-2"
}

module "network" {
  source = "./modules/network"

  vpc_cidr       = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  subnet_id = element(module.network.public_subnet_ids, 0)

  tags = {
    Name = "WebServerInstance"
  }
}

output "instance_ip" {
  value = aws_instance.web_server.public_ip
}
