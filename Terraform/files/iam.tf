

resource "aws_s3_bucket_policy" "s3BucketPolicy" {
  bucket = aws_s3_bucket.s3Bucket.id

  policy = data.aws_iam_policy_document.s3BucketPolicyDocument.json
}


data "aws_iam_policy_document" "s3BucketPolicyDocument" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.s3Bucket.arn}/*"]
    effect    = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }

  statement {
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.s3Bucket.arn]
    effect    = "Allow"

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.cloudfrontAccessIdentity.iam_arn]
    }
  }

  depends_on = [aws_s3_bucket.s3Bucket]
}
