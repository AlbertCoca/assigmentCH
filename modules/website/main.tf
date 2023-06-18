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

# In this case we are creating a vpc and a private route53 zone for testing
# proposes but in a real environment the configurations would be much different
# assesing the need for the different domains.
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_route53_zone" "private" {
  name = var.domain

  vpc {
    vpc_id = aws_vpc.main.id
  }
}

data "aws_s3_bucket" "default" {
  bucket = var.s3_bucket_id
}

resource "aws_route53_record" "web_mycardo_com" {
  zone_id = aws_route53_zone.private.zone_id
  name    = var.dns_record_name
  type    = "A"
  alias {
    name                   = aws_s3_bucket_website_configuration.default.website_endpoint
    zone_id                = data.aws_s3_bucket.default.hosted_zone_id
    evaluate_target_health = true
  }
}
