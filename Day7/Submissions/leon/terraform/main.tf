provider "aws" {
  region = var.region
}

# Dynamically name resources based on the workspace
resource "aws_s3_bucket" "example" {
  bucket = "myapp-${terraform.workspace}-${random_id.suffix.hex}"
  acl    = "private"

  tags = {
    Name        = "MyApp ${terraform.workspace} Bucket"
    Environment = terraform.workspace
  }
}

resource "random_id" "suffix" {
  byte_length = 4
}

# Output the bucket name for visibility
output "bucket_name" {
  value = aws_s3_bucket.example.bucket
}


