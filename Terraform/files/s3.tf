resource "aws_s3_bucket" "s3Bucket" {
  bucket = "${var.appName}-${var.environment}"
  acl    = "public-read"
  
  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  versioning {
    enabled = false
  }

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name        = var.appName
    Environment = var.environment
  }
}
