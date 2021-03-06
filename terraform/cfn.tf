resource "aws_cloudfront_distribution" "cdn" {
  origin {
    origin_id   = "${var.domain}"
    domain_name = "${aws_s3_bucket.site.bucket_regional_domain_name}"
  }

  # If using route53 aliases for DNS we need to declare it here too, otherwise we'll get 403s.
  aliases = ["${var.domain}"]

  enabled             = true
  default_root_object = "index.html"

  logging_config {
    include_cookies = false
    bucket          = "armstrong-s3-logs.s3.amazonaws.com"
    prefix          = "${var.domain}-cf/"
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${var.domain}"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  # The cheapest priceclass
  price_class = "PriceClass_100"

  # This is required to be specified even if it's not used.
  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  viewer_certificate {
    minimum_protocol_version = "TLSv1.2_2018"
    iam_certificate_id       = "${var.certId}"
    ssl_support_method       = "sni-only"
  }
}
