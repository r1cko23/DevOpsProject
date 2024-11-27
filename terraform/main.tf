provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "react_app_bucket" {
  bucket = "devops-project-bucket"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

resource "aws_s3_bucket_object" "react_app_files" {
  for_each = fileset("${path.module}/../build", "**")
  bucket   = aws_s3_bucket.react_app_bucket.bucket
  key      = each.value
  source   = "${path.module}/../build/${each.value}"
  content_type = lookup(
    {
      "html" = "text/html"
      "css" = "text/css"
      "js" = "application/javascript"
    },
    split(".", each.value)[-1],
    "binary/octet-stream"
  )
}
