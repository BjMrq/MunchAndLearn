resource "aws_cloudfront_origin_access_identity" "cloudfrontAccessIdentity" {
  comment = "Origin Access Identity for S3"
}

resource "aws_cloudfront_distribution" "cloudfrontDistribution" {

  origin {
    domain_name = aws_s3_bucket.s3Bucket.bucket_domain_name
    origin_id   = aws_s3_bucket.s3Bucket.id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.cloudfrontAccessIdentity.cloudfront_access_identity_path
    }
  }

  custom_error_response {
    error_code         = 403
    response_page_path = "/index.html"
    response_code      = 200
  }

  custom_error_response {
    error_code         = 404
    response_page_path = "/index.html"
    response_code      = 200
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  price_class         = var.priceClass
  default_root_object = "index.html"

   viewer_certificate {
    cloudfront_default_certificate = true
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.s3Bucket.id
    compress         = true

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  tags = {
    Name        = "${var.appName}-cloudfront"
    Environment = var.environment
  }

  depends_on = [aws_s3_bucket.s3Bucket]
}