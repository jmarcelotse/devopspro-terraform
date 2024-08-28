provider "aws" {
  region = "us-east-2"
}

module "web_server" {
  source        = "./modules/ec2_instance"
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  name          = "WebServerInstance"
}

module "db_server" {
  source        = "./modules/ec2_instance"
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.medium"
  name          = "DBServerInstance"
}

output "web_server_id" {
  value = module.web_server.instance_id
}

output "db_server_id" {
  value = module.db_server.instance_id
}
