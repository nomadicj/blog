# Note: The bucket name needs to carry the same name as the domain!
# http://stackoverflow.com/a/5048129/2966951
resource "aws_s3_bucket" "site" {
  bucket = "${var.domain}"
  acl    = "public-read"

  policy = <<EOF
{
      "Version":"2008-10-17",
      "Statement":[{
        "Sid":"AllowPublicRead",
        "Effect":"Allow",
        "Principal": {"AWS": "*"},
        "Action":["s3:GetObject"],
        "Resource":["arn:aws:s3:::${var.domain}/*"]
      }]
    }
  EOF

  website {
    index_document = "index.html"
  }

  tags = {
    site = "${var.domain}"
  }

  logging {
    target_bucket = "armstrong-s3-logs"
    target_prefix = "${var.domain}/"
  }
}
