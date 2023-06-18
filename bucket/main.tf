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
