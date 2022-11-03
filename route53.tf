data "aws_route53_zone" "selected" {
  name         = "appstellar.training"
  private_zone = false
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "web.valdrin.appstellar.training"
  type    = "A"
  ttl     = 300
  records = ["8.8.8.8"]
}
