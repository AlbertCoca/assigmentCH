terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.67.0"
    }
  }
}

module "bucket_source" {
  source = "../modules/bucket"

  bucket_name = "acoca-ch-source"
}

module "bucket_assets" {
  source = "../modules/bucket"

  bucket_name = "acoca-ch-assets"
}

module "website" {
  source = "../modules/website"

  s3_bucket_id    = module.bucket_source.s3_bucket_id
  domain          = "mycardo.com"
  dns_record_name = "web"

}
