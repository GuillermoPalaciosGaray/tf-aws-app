resource "aws_s3_bucket" "s3_bucket" {
    bucket        = var.s3_bucket_name
    acl           = var.acl
    force_destroy = var.force_destroy

    lifecycle_rule {
      id          = "Remove old files (${var.expiration_days} days)"
      enabled     = true
      prefix      = "${var.s3_bucket_name}/"
      expiration {
        days = var.expiration_days
      }
    }
    tags = {
        Name = var.s3_bucket_name
    }
}

resource "aws_s3_bucket_policy" "s3_policy" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = data.aws_iam_policy_document.s3_bucket_lb_write.json
}