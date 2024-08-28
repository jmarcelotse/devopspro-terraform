terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket = "my-terraform-state"
    key    = "global/s3/terraform.tfstate"
    region = var.region
  }
}

provider "aws" {
  region = var.region
}
