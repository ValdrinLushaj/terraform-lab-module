module "valdrin-module" {
  source  = "app.terraform.io/devops-training-valdrin/valdrin-module/assignment"
  version = "1.0.0"
  # insert required variables here

  user_name   = "valdrin-user"
  policy_name = "valdrin-policy"
  policy_document = {
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*", "iam:GetAccountPasswordPolicy", "elasticloadbalancing:DescribeLoadBalancers"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "iam:ChangePassword"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  }
}
