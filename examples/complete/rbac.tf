# Complete example 

module "infra-engineer-group" {
  source  = "tf-mod/rbac-group/aws"
  version = "1.0.0"

  name  = var.name
  stack = var.stack
  desc  = var.desc
  target_role_arn = [
    format("arn:aws:iam::%s:role/%s", 123456741781, "monitor-dev"),
    format("arn:aws:iam::%s:role/%s", 321123433657, "monitor-prod"),
  ]
}
