resource "aws_ecr_repository" "foo" {
  name                 = "devops-training-valdrin/web-app"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
