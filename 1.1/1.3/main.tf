provider "aws" {
  region = "us-east-2"
}

module "web_server" {
  source        = "./modules/ec2_instance"
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  name          = "WebServerInstance"
}

output "web_server_id" {
  value = module.web_server.instance_id
}
