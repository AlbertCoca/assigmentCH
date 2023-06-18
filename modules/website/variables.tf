variable "s3_bucket_id" {
  description = "S3 backet id to serve the static website"
  type        = string
}

variable "domain" {
  description = "Domain name to be created to service this webpage"
  type        = string
}

variable "dns_record_name" {
  description = "DNS register from which the webpage will be served"
  type        = string
}

