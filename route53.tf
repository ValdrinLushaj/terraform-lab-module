data "aws_route53_zone" "selected" {
  name         = "appstellar.training"
  private_zone = false
}

data "aws_lb" "this" {
  tags = {
    "ingress.k8s.aws/resource" = "LoadBalancer",
    "ingress.k8s.aws/stack"    = "default",
    "elbv2.k8s.aws/cluster"    = "my-eks-cluster"
  }
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "web.valdrin.appstellar.training"
  type    = "A"
  ttl     = 300
  records = ["8.8.8.8"]
}
