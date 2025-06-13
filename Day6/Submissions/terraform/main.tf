terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "terraform-up-and-running-state"    # replace with your actual bucket
    key    = "global/s3/terraform.tfstate"
    region = "us-east-1"                         # replace if needed
  }
}

provider "aws" {
  region = "us-east-1"                           # update to your AWS region
}

resource "aws_s3_bucket" "example" {
  bucket = "bran-tech-demo-bucket"               # must be globally unique
  acl    = "private"

  tags = {
    Name        = "BranTech Demo Bucket"
    Environment = "Dev"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.example.id
}
