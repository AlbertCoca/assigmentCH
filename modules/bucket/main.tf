resource "aws_s3_bucket" "default" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.default.id

  rule {
    apply_server_side_encryption_by_default {
      # kms_master_key_id = aws_kms_key.bucket.arn
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_ownership_controls" "default" {
  bucket = aws_s3_bucket.default.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "default" {
  depends_on = [aws_s3_bucket_ownership_controls.default]

  bucket = aws_s3_bucket.default.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "default" {
  bucket = aws_s3_bucket.default.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "l1" {
  bucket = aws_s3_bucket.default.id
  rule {
    status = "Enabled"
    id     = "expire_all_files"
    expiration {
      days = 30
    }
  }
}

resource "random_string" "random" {
  count = 3

  length           = 16
  special          = true
  override_special = "/@£$"
}

resource "aws_s3_object" "object" {
  count = 3

  bucket  = aws_s3_bucket.default.id
  key     = "dummy-${count.index}"
  content = random_string.random[count.index].result
}
