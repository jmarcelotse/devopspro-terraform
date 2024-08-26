provider "aws" {
  region = "us-east-2"
}

provider "google" {
  project = "my-gcp-project"
  region  = "us-central1"
}

resource "aws_s3_bucket" "aws_bucket" {
  bucket = "my-aws-bucket-123-tse"

  tags = {
    Name = "MyAWSS3Bucket"
  }
}

resource "aws_s3_bucket_acl" "aws_bucket_acl" {
  bucket = aws_s3_bucket.aws_bucket.bucket
  acl    = "private"
}

resource "google_storage_bucket" "gcp_bucket" {
  provider = google
  name     = "my-gcp-bucket-123-tse"
  location = "US"

  labels = {
    environment = "production"
  }
}
