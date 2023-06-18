locals {
  index = "index.html"
  error = "error.html"
}

resource "aws_s3_bucket_website_configuration" "default" {
  bucket = var.s3_bucket_id

  index_document {
    suffix = local.index
  }

  error_document {
    key = local.error
  }
}

resource "aws_s3_object" "index" {
  bucket       = var.s3_bucket_id
  key          = local.index
  content_type = "text/html"
  source       = "${path.module}/website/index.html"
}

resource "aws_s3_object" "error" {
  bucket       = var.s3_bucket_id
  key          = local.error
  content_type = "text/html"
  source       = "${path.module}/website/error.html"
}
