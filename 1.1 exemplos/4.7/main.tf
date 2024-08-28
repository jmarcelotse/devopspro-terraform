terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket = "my-terraform-state"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-2"
  }
}
