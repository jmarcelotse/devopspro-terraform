provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "WebServerInstance"
  }
}

resource "aws_s3_bucket" "web_assets" {
  bucket = "my-unique-bucket-name-12390"

  tags = {
    Name        = "WebAssetsBucket"
    Environment = "Production"
  }
}
