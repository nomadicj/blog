# Note: Creating this route53 zone is not enough. The domain's name servers need to point to the NS
# servers of the route53 zone. Otherwise the DNS lookup will fail.
# To verify that the dns lookup succeeds: `dig site @nameserver`

resource "aws_route53_zone" "main" {
  name = "${var.domain}"
}

resource "aws_route53_record" "root_domain" {
  zone_id = "${aws_route53_zone.main.zone_id}"
  name = "${var.domain}"
  type = "A"

  alias {
    name = "${aws_cloudfront_distribution.cdn.domain_name}"
    zone_id = "${aws_cloudfront_distribution.cdn.hosted_zone_id}"
    evaluate_target_health = false
  }
}
